import SwiftUI

struct MovieBookingView: View {
    
    @StateObject private var viewModel = MovieBookingViewModel()
    
    
    // MARK: - Main Body
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 0) {
               
                HStack {
                    Text("영화별 예매")
                        .font(.bold22)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 31)
                .padding(.bottom, 10)
                .background(.purple03)
                ScrollView
                {
                    
                    VStack(alignment: .leading, spacing: 23) {
                        
                        movieSelectionHeader
                        moviePostersList
                        theaterSelectionButtons
                        
                        dateSelectionView
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                
                
            }
            
        }
    }
    
    // MARK: - UI Components (분리된 서브 뷰)
    
    /// 1. 선택된 영화 정보를 보여주는 헤더 뷰
    private var movieSelectionHeader: some View {
        HStack {
            Text("15")
                .font(.bold18)
                .foregroundColor(.white)
                .frame(width: 26, height: 24)
                .background(.orange) // 순서 수정
                .cornerRadius(4)
                .overlay(
                       RoundedRectangle(cornerRadius: 4)
                           .stroke(Color.black, lineWidth: 1) // 100% 검은색 외곽선
                   )
                   .shadow(color: .black.opacity(0.25), radius: 3, x: 0, y: 2)
            
             Spacer()
            
            Text(viewModel.selectedMovie?.movieName ?? "영화를 선택하세요")
                .font(.semiBold18)
                .frame(width: 238, height: 24, alignment: .leading)
            
            
            Button(action: {}, label: {
                Text("전체영화")
                    .font(.semiBold14)
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .frame(width: 69, height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.grey02, lineWidth: 1)
                    )
            })
        }
        
    }
    
    /// 2. 영화 포스터들을 보여주는 가로 스크롤 뷰
    private var moviePostersList: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(viewModel.movieCards) { movie in
                    movie.image
                        .resizable()
                        .frame(width: 62, height: 89)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(viewModel.selectedMovieID == movie.id ? .purple03 : Color.clear, lineWidth: 4)
                        )
                        .onTapGesture {
                            withAnimation {
                                viewModel.selectMovie(id: movie.id)
                            }
                        }
                }
            }
        }
     
    }
    
    /// 3. 극장 선택 버튼들을 보여주는 뷰
    private var theaterSelectionButtons: some View {
        HStack(spacing: 10) {
            ForEach(["강남", "홍대", "신촌"], id: \.self) { theaterName in
                theaterButton(place: theaterName)
            }
        }
        
    }
    

    private var dateSelectionView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(viewModel.weekDates, id: \.self) { date in
                    dateCell(for: date)
                }
            }
        }
        // 극장이 선택되지 않았다면 전체적으로 반투명하게 처리
        .opacity(viewModel.isDateSelectionEnabled ? 1.0 : 0.4)
        // 극장이 선택되지 않았다면 터치 불가
        .disabled(!viewModel.isDateSelectionEnabled)
    }
    
    
    //------------------------------------
    private func theaterButton(place: String) -> some View {
        
        
        Button(action: {
            
            viewModel.selectTheater(name: place)
            
            
        }, label: {
            Text(place)
                .font(.semiBold16)
                .foregroundColor(viewModel.selectedTheaters.contains(place) ? .white : (viewModel.isTheaterButtonEnabled ? .grey05 : .gray))
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .frame(width:55, height: 35)
                .background(viewModel.selectedTheaters.contains(place) ? .purple03 : Color.grey01)
                .cornerRadius(15)
                
            
            
        }).disabled(!viewModel.isTheaterButtonEnabled)
            .animation(.easeInOut(duration: 0.2), value: viewModel.selectedTheaters.contains(place))
            .animation(.easeInOut(duration: 0.2), value: viewModel.isTheaterButtonEnabled)
        
    }
    
   
       private func dateCell(for date: Date) -> some View {

           
           VStack(spacing: 4){
               // "9.22" 형식으로 날짜 표시
               Text(date.formatted(.dateTime.day()))
                           .font(.bold18)
               
               // "오늘", "내일", "수" 형식으로 요일 표시
               Text(formatWeekday(date))
                   .font(.semiBold14)
                   
           }
           .padding(.vertical,12)
           .padding(.horizontal, 10)
           .frame(width: 55, height: 60)
           .foregroundColor(viewModel.selectedDate == date ? .white : getWeekdayColor(for: date))
           .background(
               RoundedRectangle(cornerRadius: 12)
                .fill(viewModel.selectedDate == date ? .purple03: Color.clear)
           )
           .onTapGesture {
               viewModel.selectDate(date)
           }
       }
    

       private func getWeekdayColor(for date: Date) -> Color {
           let calendar = Calendar.current
           if calendar.isDateInWeekend(date) {
               let weekday = calendar.component(.weekday, from: date)
               return weekday == 1 ? .red : .tag // 일요일: 빨강, 토요일: 파랑
           }
           return .black // 평일: 검정
       }
    
       private func formatWeekday(_ date: Date) -> String {
           let calendar = Calendar.current
           if calendar.isDateInToday(date) {
               return "오늘"
           } else if calendar.isDateInTomorrow(date) {
               return "내일"
           } else {
               // "월", "화", "수"... 형식으로 변환
               let formatter = DateFormatter()
               formatter.locale = Locale(identifier: "ko_KR")
               formatter.dateFormat = "E" // "E"는 요일을 한 글자로 표시
               return formatter.string(from: date)
           }
       }

}
    

#Preview {
    MovieBookingView()
}

