import Foundation
import Combine
import SwiftUI


class MovieBookingViewModel: ObservableObject {
    
    // UI와 관련된 데이터들
    @Published var movieCards: [MovieCards] = []
    @Published var selectedMovieID: UUID? = nil
    @Published var isTheaterButtonEnabled: Bool = false
    @Published var selectedTheaters: [String] = []
    
    @Published var weekDates: [Date] = []
    @Published var selectedDate: Date? = nil
    
    @Published var isDateSelectionEnabled: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    var selectedMovie: MovieCards? {
        movieCards.first { $0.id == selectedMovieID }
    }
    
    init() {
     
        loadMovieData()
        generateDatesForWeek()
 
        setupButtonStateSubscription()
        setupDateSelectionSubscription()
    }
    
    private func setupButtonStateSubscription() {
        $selectedMovieID
            .map { movieID in
                return movieID != nil
            }            .assign(to: &$isTheaterButtonEnabled)
    }
    
    private func setupDateSelectionSubscription() {
          $selectedTheaters 
              // selectedTheaters 배열이 비어있지 않으면 true, 비어있으면 false 반환
              .map { !$0.isEmpty }
              // 그 결과를 isDateSelectionEnabled에 할당
              .assign(to: &$isDateSelectionEnabled)
      }

    
    
    // 뷰에서 호출할 메서드 (로직을 뷰에서 분리)
    func selectMovie(id: UUID?) {
        // 애니메이션 효과를 위해 main thread에서 실행
        DispatchQueue.main.async {
            withAnimation {
                self.selectedMovieID = id
            }
        }
    }
    //날짜를 선택/해제하는 메서드 추가
        func selectDate(_ date: Date) {
            // 이미 선택된 날짜를 다시 누르면 선택 해제
            if selectedDate == date {
                selectedDate = nil
            } else {
                // 다른 날짜를 누르면 그 날짜로 선택 변경
                selectedDate = date
            }
        }
    
    
    //극장을 선택(또는 해제)하는 메서드 추가
    func selectTheater(name: String) {
        // 배열에 이미 선택한 극장 이름이 있는지 확인
        if let index = selectedTheaters.firstIndex(of: name) {
            // 있으면 배열에서 제거 (선택 해제)
            selectedTheaters.remove(at: index)
        } else {
            // 없으면 배열에 추가 (선택)
            selectedTheaters.append(name)
        }
    }
    //오늘부터 7일간의 날짜를 생성하는 메서드
    private func generateDatesForWeek() {
        let calendar = Calendar.current
        let today = Date()
        
        var dates: [Date] = []
        for i in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: i, to: today) {
                dates.append(date)
            }
        }
        self.weekDates = dates
    }
    
    
    private func loadMovieData() {
        let azzulDesc = MovieDescription(detail1: "", detail2: "", detail3: "", detail4: "", detail5: "")
        let guikalDesc = MovieDescription(detail1: "", detail2: "", detail3: "", detail4: "", detail5: "")
        let f1Desc = MovieDescription(detail1: "최고가 되지 못한 전설 VS 최고가 되고 싶은 루키", detail2: "한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고", detail3: "한순간에 추락한 드라이버 ‘손; 헤이스'(브래드 피트).", detail4: "그의 오랜 동료인 ‘루벤 세르반테스'(하비에르 바르뎀)에게", detail5: "레이싱 복귀를 제안받으며 최하위 팀인 APGXP에 합류한다.")
        let faceDesc = MovieDescription(detail1: "", detail2: "", detail3: "", detail4: "", detail5: "")
        let himeDesc = MovieDescription(detail1: "", detail2: "", detail3: "", detail4: "", detail5: "")
        let bossDesc = MovieDescription(detail1: "", detail2: "", detail3: "", detail4: "", detail5: "")
        let yadangDesc = MovieDescription(detail1: "", detail2: "", detail3: "", detail4: "", detail5: "")
        let rosesDesc = MovieDescription(detail1: "", detail2: "", detail3: "", detail4: "", detail5: "")
    

        
        let azzul = MovieCards(image: Image("어쩔수가없다"), booking: true, movieName: "어쩔수가없다",watchedStatus: "20만", movieNameEn: "Can't Help It", movieDescription: azzulDesc)
        let guikal = MovieCards(image: Image("귀멸의칼날"), booking: true, movieName: "극장판 귀멸의칼날",watchedStatus: "1", movieNameEn: "Demon Slayer", movieDescription: guikalDesc)
        let f1 = MovieCards(image: Image("f1"), booking: true, movieName: "F1 더 무비", watchedStatus: "1", movieNameEn: "F1: The Movie", movieDescription: f1Desc)
        let face = MovieCards(image: Image("얼굴"), booking: true, movieName: "얼굴", watchedStatus: "20만", movieNameEn: "Face", movieDescription: faceDesc)
        let hime = MovieCards(image: Image("모노노케히메"), booking: true, movieName: "모노노케히메", watchedStatus: "20만", movieNameEn: "Princess Mononoke", movieDescription: himeDesc)
        let boss = MovieCards(image: Image("보스"), booking: true, movieName: "보스", watchedStatus: "20만", movieNameEn: "The boss", movieDescription: bossDesc)
        let yadang = MovieCards(image: Image("야당"), booking: true, movieName: "야당", watchedStatus: "20만", movieNameEn: "Yadang", movieDescription: yadangDesc)
        let roses = MovieCards(image: Image("로즈"), booking: true, movieName: "The Roses", watchedStatus: "20만", movieNameEn: "The roses", movieDescription: rosesDesc)
        
    
    
        self.movieCards = [azzul, guikal, f1, face, hime, boss, yadang, roses]
    }
}
