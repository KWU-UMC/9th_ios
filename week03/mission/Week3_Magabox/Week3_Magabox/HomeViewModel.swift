//
//  HomeViewModel.swift
//  Week3_Magabox
//
//  Created by 최우진 on 10/4/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {

    // 화면 상태
    @Published var topTab: HomeTopTab = .home
    @Published var chip: MovieChip = .chart
    @Published var bottomTabIndex: Int = 0

    // 더미 데이터 (필요 시 네트워크 대체)
    @Published private(set) var movies: [Movie] = [
        Movie(
            poster: "어쩔수가 없다",
            title: "어쩔수가 없다",
            audience: "누적관객수 20만",
            header: "어쩔수가 없다",
            subtitle: "F1 : The Movie",
            overview:
            """
            최고가 되지 못한 전설 VS 최고가 되고 싶은 루키
            
            한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고
            한순간에 추락한 드라이버 ‘숀·헤이스’(브래드 피트).
            그의 오랜 동료 ‘루벤 세르반테스’(하비에르 바르뎀)에게
            레이싱 복귀를 제안받으며 최하위 팀 APGXP에 합류한다.
            """,
            ageRating: "12세 이상 관람가",
            releaseDate: "2025.06.25 개봉"
        ),
        Movie(
            poster: "무한성",
            title: "극장판 귀멸의 칼날: 무한성 편",
            audience: "누적관객수 1",
            header: "무한성",
            subtitle: "F1 : The Movie",
            overview:
            """
            최고가 되지 못한 전설 VS 최고가 되고 싶은 루키
            한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고
            한순간에 추락한 드라이버 ‘숀·헤이스’(브래드 피트).
            그의 오랜 동료 ‘루벤 세르반테스’(하비에르 바르뎀)에게
            레이싱 복귀를 제안받으며 최하위 팀 APGXP에 합류한다.
            """,
            ageRating: "12세 이상 관람가",
            releaseDate: "2025.06.25 개봉"
        ),
        Movie(
            poster: "f1",
            title: "F1 더 무비",
            audience: "누적관객수 -",
            header: "f1_header",                 // ← 상세 상단 히어로 이미지
            subtitle: "F1 : The Movie",
            overview:
            """
            최고가 되지 못한 전설 VS 최고가 되고 싶은 루키
            
            한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고
            한순간에 추락한 드라이버 ‘숀·헤이스’(브래드 피트).
            그의 오랜 동료 ‘루벤 세르반테스’(하비에르 바르뎀)에게
            레이싱 복귀를 제안받으며 최하위 팀 APGXP에 합류한다.
            """,
            ageRating: "12세 이상 관람가",
            releaseDate: "2025.06.25 개봉"
        ),
        Movie(
            poster: "image 1",
            title: "얼굴",
            audience: "누적관객수 -",
            header: "image 1",
            subtitle: "F1 : The Movie",
            overview:
            """
            최고가 되지 못한 전설 VS 최고가 되고 싶은 루키
            한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고
            한순간에 추락한 드라이버 ‘숀·헤이스’(브래드 피트).
            그의 오랜 동료 ‘루벤 세르반테스’(하비에르 바르뎀)에게
            레이싱 복귀를 제안받으며 최하위 팀 APGXP에 합류한다.
            """,
            ageRating: "12세 이상 관람가",
            releaseDate: "2025.06.25 개봉"
        ),
        Movie(
            poster: "image 2",
            title: "정글",
            audience: "누적관객수 -",
            header: "image 2",
            subtitle: "F1 : The Movie",
            overview:
            """
            최고가 되지 못한 전설 VS 최고가 되고 싶은 루키
            한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고
            한순간에 추락한 드라이버 ‘숀·헤이스’(브래드 피트).
            그의 오랜 동료 ‘루벤 세르반테스’(하비에르 바르뎀)에게
            레이싱 복귀를 제안받으며 최하위 팀 APGXP에 합류한다.
            """,
            ageRating: "12세 이상 관람가",
            releaseDate: "2025.06.25 개봉"
        )
    ]

    @Published private(set) var upcomingMovies: [Movie] = [
        Movie(
            poster: "image 1",
            title: "얼굴",
            audience: "누적관객수 -",
            header: "image 1",
            subtitle: "F1 : The Movie",
            overview:
            """
            최고가 되지 못한 전설 VS 최고가 되고 싶은 루키
            한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고
            한순간에 추락한 드라이버 ‘숀·헤이스’(브래드 피트).
            그의 오랜 동료 ‘루벤 세르반테스’(하비에르 바르뎀)에게
            레이싱 복귀를 제안받으며 최하위 팀 APGXP에 합류한다.
            """,
            ageRating: "12세 이상 관람가",
            releaseDate: "2025.06.25 개봉"
        ),
        Movie(
            poster: "image 2",
            title: "정글",
            audience: "누적관객수 -",
            header: "image 2",
            subtitle: "F1 : The Movie",
            overview:
            """
            최고가 되지 못한 전설 VS 최고가 되고 싶은 루키
            한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고
            한순간에 추락한 드라이버 ‘숀·헤이스’(브래드 피트).
            그의 오랜 동료 ‘루벤 세르반테스’(하비에르 바르뎀)에게
            레이싱 복귀를 제안받으며 최하위 팀 APGXP에 합류한다.
            """,
            ageRating: "12세 이상 관람가",
            releaseDate: "2025.06.25 개봉"
        ),
        Movie(
            poster: "f1",
            title: "F1 더 무비",
            audience: "누적관객수 -",
            header: "f1_header",                 // ← 상세 상단 히어로 이미지
            subtitle: "F1 : The Movie",
            overview:
            """
            최고가 되지 못한 전설 VS 최고가 되고 싶은 루키
            한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고
            한순간에 추락한 드라이버 ‘숀·헤이스’(브래드 피트).
            그의 오랜 동료 ‘루벤 세르반테스’(하비에르 바르뎀)에게
            레이싱 복귀를 제안받으며 최하위 팀 APGXP에 합류한다.
            """,
            ageRating: "12세 이상 관람가",
            releaseDate: "2025.06.25 개봉"
        )
    ]

    // 현재 칩에 따른 노출 리스트
    var displayedMovies: [Movie] {
        chip == .chart ? movies : upcomingMovies
    }

    // 액션 헬퍼 (원하면 로깅/트래킹 추가)
    func selectTopTab(_ tab: HomeTopTab) { topTab = tab }
    func selectChip(_ chip: MovieChip)   { self.chip = chip }
}
