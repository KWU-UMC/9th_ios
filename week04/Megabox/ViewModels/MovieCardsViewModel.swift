import SwiftUI

import Foundation

@Observable
class MovieCardsViewModel{
    // 모델안에 모델을 넣는식
    // 
    var movieCards: [MovieCards] = []
    
    init() {
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
