import SwiftUI

import Foundation

@Observable
class MovieCardsViewModel{
    
    var movieCards: [MovieCards] = []
    
    init() {
        let azzul = MovieCards(image: Image("어쩔수가없다"), booking: true, movieName: "어쩔수가없다",watchedStatus: "20만", movieNameEn: "Can't Help It")
        let guikal = MovieCards(image: Image("귀멸의칼날"), booking: true, movieName: "극장판 귀멸의칼날",watchedStatus: "1", movieNameEn: "Demon Slayer")
        let f1 = MovieCards(image: Image("f1"), booking: true, movieName: "F1 더 무비", watchedStatus: "1", movieNameEn: "F1: The Movie")
        let face = MovieCards(image: Image("얼굴"), booking: true, movieName: "얼굴", watchedStatus: "20만", movieNameEn: "Face")
        let hime = MovieCards(image: Image("모노노케히메"), booking: true, movieName: "모노노케히메", watchedStatus: "20만", movieNameEn: "Princess Mononoke")
        
        self.movieCards = [azzul, guikal, f1, hime]
        
    }
    
    
    
}
