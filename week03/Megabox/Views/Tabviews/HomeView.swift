
import SwiftUI


struct HomeView: View {
    //현재 버튼의 상태 저장
    @State private var selectedChart: ChartType = .movieChart
    @State private var viewModel = MovieCardsViewModel()
    
    
    var body: some View {
        
        NavigationStack{
            ScrollView {
                headerSection
                    .padding(.bottom, 9)
                // 3. '무비차트'와 '상영예정' 버튼을 표시하는 섹션을 추가합니다.
                chartSelectionSection
                    .padding(.bottom, 25)
                
                
                
                // 4. selectedChart의 값에 따라 어떤 뷰를 보여줄지 결정합니다.
                if selectedChart == .movieChart {
                    movieChartSection
                        .padding(.bottom, 38.5)
                } else {
                    // '상영예정' 뷰를 여기에 추가할 수 있습니다.
                    Text("상영 예정작 컨텐츠가 여기에 표시됩니다.")
                        .padding()
                }
                
                
                
                movieFeedSection
                
                
            }
        }
        
         }
    
    
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 1. 로고 이미지
            Image("meboxLogo 2")
                .resizable()
                .scaledToFit()
                .frame(width: 149,height: 30) // 이미지 높이 조절

            // 2. 텍스트 링크들을 담을 HStack
            HStack(spacing: 24) { // 텍스트 사이 간격 조절
                texts(section: "홈")
                texts(section: "이벤트")
                texts(section: "스토어")
                texts(section: "선호극장")

                // 3. Spacer가 남은 공간을 모두 밀어내어 텍스트들을 왼쪽으로 정렬
                Spacer()
            }
        }
        .padding() // 헤더 전체에 여백 추가
    }
    
    private var chartSelectionSection: some View{
        
        
        HStack(spacing: 8){
            

            buttons(name:"무비차트", section: .movieChart)
            buttons(name: "상영예정", section: .comingSoon)
            Spacer()
            
            
        }
        .padding(.horizontal)
        
        
        
        
    }
    
    
    private var movieChartSection: some View{
        
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 24){
                ForEach(viewModel.movieCards){
                    movie in
                    NavigationLink(destination: MovieDetailView(movie: movie), label:{
                        MovieCardView(movie: movie)
                        .buttonStyle(PlainButtonStyle())
                    })
                   
                    
                    
                    
                }
            }
            .padding(.horizontal)
            
            
        }
        
        
        
        
        
    }
    
    private var movieFeedSection: some View{
        
        VStack(alignment: .leading, spacing: 16){
            
            // HStack을 Text로 변경하고 수식어를 추가합니다.
            Text("알고보면 더 재밌는 무비피드")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
            // 1. 텍스트가 사용 가능한 모든 너비를 차지하되, 내용은 왼쪽에 정렬합니다.
                .frame(maxWidth: .infinity, alignment: .leading)
            // 2. 차지한 영역의 오른쪽 끝에 버튼을 겹쳐서 올립니다.
                .overlay(alignment: .trailing) {
                    Button(action: {
                        print("무비피드 더보기")
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                    }
                }

        
            
            Image("moviefeed")
                .resizable()
                .frame(maxWidth: .infinity)
                
            feedItem(
                imageName: "image 2",
                title: "9월, 메가박스의 영화들(1) - 명작들의 재개봉",
                subtitle: "<모노노케 히메>, <퍼펙트 블루>"
            )
            
            feedItem(
                imageName: "image 3",
                title: "메가박스 오리지널 티켓 Re.37 <얼굴>",
                subtitle: "영화 속 양극적인 감정의 대비"
            )
            
            
            
        }
        .padding(.horizontal)
        
        
        
        
    }
    
    
    
// ------------------------------------------ 반복 코드 함수들
    private func texts(section: String) -> some View{
        
        Text(section)
            .font(.semiBold24)
            .foregroundColor(.black)

        
    }
    
    private func buttons(name :String, section: ChartType ) -> some View{
        
        Button(action: {
            
            selectedChart = section
            
            
        }, label: {
            
            Text(name)
                .font(.semiBold12)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .foregroundColor(selectedChart == section ? .white : .black)
            // selectedChart 상태에 따라 배경색 변경
                .background(selectedChart == section ? .black : Color(.systemGray5))
                .clipShape(Capsule()) // 캡슐 모양으로
            
            
        })
        
        
    }
    
    private func feedItem(imageName: String, title: String, subtitle: String) -> some View {
        HStack(spacing: 16) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                   
                     

                Text(subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .lineLimit(1) // 👈 글자를 한 줄로 제한합니다.
            }
            
            Spacer() // 텍스트를 왼쪽으로 밀착시킵니다.
        }
    }
    
        
}

#Preview {
    HomeView()
}
