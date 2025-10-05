//
//  HomeModel.swift
//  Week3_Magabox
//
//  Created by 최우진 on 10/4/25.
//

import Foundation


// 상단 텍스트 탭
enum HomeTopTab: Int, CaseIterable {
    case home, event, store, favorite
    var title: String {
        switch self {
        case .home:     return "홈"
        case .event:    return "이벤트"
        case .store:    return "스토어"
        case .favorite: return "선호극장"
        }
    }
}

// 칩(무비차트 / 상영예정)
enum MovieChip: Int { //case에 따라 String 값을 유동적으로 변경 가능
    case chart = 0
    case upcoming = 1

    var title: String {
        switch self { //case에 따라 String 값을 유동적으로 변경 가능
        case .chart:   return "무비차트"
        case .upcoming:return "상영예정"
        }
    }
}

// 영화 데이터 모델
// Identifiable은 고유 ID를 알리는 프로토컬이고 Hashable은 해시값으로 쓸 수 있도록 하는겨
// 즉 Identifiable->foreach, Hashable->NavigationLink
struct Movie: Identifiable, Hashable {
    let id = UUID()
    let poster: String
    let title: String
    let audience: String

    let header: String
    let subtitle: String?
    let overview: String?
    let ageRating: String?
    let releaseDate: String?
}
