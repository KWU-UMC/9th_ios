import SwiftUI
import Foundation


struct MovieCards: Identifiable{
    
    let id = UUID()
    var image: Image
    var booking: Bool
    var movieName: String
    var watchedStatus: String
    var movieNameEn: String // 영문 제목 추가
}

