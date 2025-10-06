//  HomeView.swift
//  Week3_Magabox
//
//  Created by 최우진 on 10/2/25.
//

import SwiftUI

struct HomeView: View {
    // 화면 상태 및 뷰 모델
    @StateObject private var vm = HomeViewModel()
    @Namespace private var tabNS

    // 상세 화면의 상단 탭 상태
    private enum DetailTab { case info, reviews }
    @State private var detailTab: DetailTab = .info

    // 내비게이션 뒤로가기 처리
    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            // MARK: - 상단 영역 + 본문
            VStack(spacing: 9) {

                // MARK: 상단 헤더
                VStack(alignment: .leading, spacing: 12) {

                    // 로고
                    HStack(spacing: 0) {
                        Image("meboxLogo_home")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 149, height: 30)
                        Spacer()
                    }

                    // 상단 텍스트 탭
                    HStack(spacing: 28) {
                        ForEach(HomeTopTab.allCases, id: \.self) { tab in
                            let selected = (vm.topTab == tab)

                            Button { vm.selectTopTab(tab) } label: {
                                Text(tab.title)
                                    .font(.custom("Pretendard",
                                                  size: 24,
                                                  relativeTo: .title3))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(selected ? Color.black : Color.gray04)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }

                // MARK: 본문 스크롤
                ScrollView {

                    // 칩(무비차트 / 상영예정)
                    HStack(spacing: 23) {
                        let chipWidth: CGFloat = 84
                        let chipHeight: CGFloat = 38
                        let chipRadius: CGFloat = 30

                        // 무비차트
                        Button { vm.selectChip(.chart) } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: chipRadius, style: .continuous)
                                    .fill(vm.chip == .chart ? Color.gray08 : Color.gray02)
                                Text(MovieChip.chart.title)
                                    .font(.PretendardMedium14)
                                    .foregroundColor(vm.chip == .chart ? .white : Color.gray04)
                            }
                            .frame(width: chipWidth, height: chipHeight)
                        }
                        .buttonStyle(.plain)

                        // 상영예정
                        Button { vm.selectChip(.upcoming) } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: chipRadius, style: .continuous)
                                    .fill(vm.chip == .upcoming ? Color.gray08 : Color.gray02)
                                Text(MovieChip.upcoming.title)
                                    .font(.PretendardMedium14)
                                    .foregroundColor(vm.chip == .upcoming ? .white : Color.gray04)
                            }
                            .frame(width: chipWidth, height: chipHeight)
                        }
                        .buttonStyle(.plain)

                        Spacer()
                    }

                    // 섹션 묶음
                    VStack(alignment: .leading, spacing: 37) {

                        // 가로 스크롤 무비 카드
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 24) {
                                ForEach(vm.displayedMovies) { movie in
                                    VStack(alignment: .leading, spacing: 8) {

                                        // 포스터 → 상세 진입
                                        NavigationLink(value: movie) {
                                            Image(movie.poster)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 148, height: 212)
                                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.black.opacity(0.06), lineWidth: 1)
                                                )
                                        }
                                        .buttonStyle(.plain)

                                        // 액션 버튼(예매/상영예정)
                                        Button { /* TODO */ } label: {
                                            Text(vm.chip == .chart ? "바로 예매" : "상영 예정")
                                                .font(.PretendardMedium16)
                                                .foregroundColor(.purple03)
                                                .frame(width: 148, height: 36)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 14)
                                                        .stroke(Color.purple03, lineWidth: 1)
                                                )
                                        }
                                        .buttonStyle(.plain)

                                        // 타이틀/보조 텍스트
                                        VStack(alignment: .leading, spacing: 0) {
                                            Text(movie.title)
                                                .font(.PretendardBold22)
                                                .foregroundColor(.primary)
                                                .frame(width: 148, alignment: .leading)
                                                .lineLimit(1)

                                            Text(movie.audience)
                                                .font(.PretendardMedium18)
                                                .foregroundStyle(.secondary)
                                                .frame(width: 148, alignment: .leading)
                                        }
                                    }
                                }
                            }
                        }
                        .scrollIndicators(.hidden)

                        // 무비피드 히어로(제목 + 배너)
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("알고보면 더 재밌는 무비피드")
                                    .font(.PretendardBold24)
                                Spacer()
                                Button {} label: {
                                    Image(systemName: "arrow.right")
                                        .font(.title3.weight(.semibold))
                                        .frame(width: 39, height: 39)
                                        .background(.ultraThinMaterial)
                                        .clipShape(Circle())
                                }
                                .buttonStyle(.plain)
                            }

                            Image("image 3")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 221)
                        }

                        // 추가 피드 2행
                        VStack(spacing: 39) {

                            // 1행
                            HStack(alignment: .top, spacing: 0) {
                                Image("재개봉")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 14))

                                Spacer()

                                VStack(alignment: .leading, spacing: 25) {
                                    Text("9월, 메가박스의 영화들(1) - 명작들의 재개봉")
                                        .frame(width: 285, alignment: .leading)
                                        .font(.PretendardSemiBold18)
                                        .foregroundColor(.black)

                                    Text("<모노노케 히메>, <퍼펙트 블루>")
                                        .font(.PretendardSemiBold13)
                                        .foregroundStyle(.secondary)
                                        .lineLimit(1)
                                    Spacer()
                                }
                            }

                            // 2행
                            HStack(alignment: .top, spacing: 0) {
                                Image("image 2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 14))

                                Spacer()

                                VStack(alignment: .leading, spacing: 25) {
                                    Text("메가박스 오리지널 티켓 Re.37 <얼굴>")
                                        .frame(width: 285, alignment: .leading)
                                        .font(.PretendardSemiBold18)
                                        .foregroundColor(.black)
                                        .lineLimit(2)

                                    Text("영화 속 양극적인 감정의 대비")
                                        .font(.PretendardSemiBold13)
                                        .foregroundStyle(.secondary)
                                        .lineLimit(1)
                                    Spacer()
                                }
                                .frame(width: 285)
                            }
                            Spacer()
                        }
                        .padding(.bottom, 32)
                    }
                    .padding(.top, 8)
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal, 16)

            // MARK: - 하단 커스텀 탭
            .safeAreaInset(edge: .bottom) {
                let tabItems: [(title: String, active: String, inactive: String)] = [
                    ("홈", "house.fill", "house"),
                    ("바로 예매", "play.rectangle.fill", "play.rectangle"),
                    ("모바일 오더", "popcorn.fill", "popcorn"),
                    ("마이 페이지", "person.fill", "person")
                ]

                HStack(spacing: 8) {
                    ForEach(Array(tabItems.enumerated()), id: \.offset) { i, item in
                        Button {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                                vm.bottomTabIndex = i
                            }
                        } label: {
                            ZStack {
                                if vm.bottomTabIndex == i {
                                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                                        .fill(Color.white)
                                        .matchedGeometryEffect(id: "TAB_BG", in: tabNS)
                                        .shadow(color: .black.opacity(0.12), radius: 10, y: 4)
                                }
                                VStack(spacing: 6) {
                                    Image(systemName: vm.bottomTabIndex == i ? item.active : item.inactive)
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.black.opacity(vm.bottomTabIndex == i ? 1 : 0.6))
                                    Text(item.title)
                                        .font(.footnote.weight(.semibold))
                                        .foregroundStyle(vm.bottomTabIndex == i ? Color.black : Color.secondary)
                                        .lineLimit(1)
                                }
                                .padding(.horizontal, 8)
                            }
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(10)
                .frame(width: 360, height: 68)
                .background(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .fill(.ultraThinMaterial)
                        .overlay(
                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .stroke(Color.white.opacity(0.35), lineWidth: 0.5)
                        )
                        .shadow(color: .black.opacity(0.08), radius: 18, y: 8)
                )
                .padding(.horizontal, 12)
                .padding(.bottom, 6)
            }

            // MARK: - 상세 화면 (Movie 값 기반 라우팅)
            .navigationDestination(for: Movie.self) { movie in
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {

                        // 상단 히어로 이미지
                        let heroName = movie.header
                        ZStack(alignment: .bottom) {
                            Image(heroName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 248)
                                .clipped()
                        }

                        // 타이틀/부제/개요
                        VStack(spacing: 22) {
                            VStack(spacing: 9) {
                                VStack(spacing: 0) {
                                    Text(movie.title)
                                        .font(.PretendardBold22)
                                        .multilineTextAlignment(.center)

                                    if let sub = movie.subtitle {
                                        Text(sub)
                                            .font(.PretendardSemiBold14)
                                            .foregroundStyle(.secondary)
                                            .multilineTextAlignment(.center)
                                    }
                                }

                                if let ov = movie.overview {
                                    Text(ov)
                                        .font(.PretendardSemiBold18)
                                        .foregroundStyle(.secondary)
                                        .lineSpacing(5)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .center)

                            // 상세/실관람평 탭 헤더
                            VStack(spacing: 0) {
                                HStack {
                                    Spacer()
                                    Button {
                                        withAnimation(.easeInOut(duration: 0.2)) { detailTab = .info }
                                    } label: {
                                        Text("상세 정보")
                                            .font(.PretendardBold22)
                                            .foregroundColor(detailTab == .info ? .primary : .secondary)
                                    }

                                    Spacer()
                                    Spacer()

                                    Button {
                                        withAnimation(.easeInOut(duration: 0.2)) { detailTab = .reviews }
                                    } label: {
                                        Text("실관람평")
                                            .font(.PretendardBold22)
                                            .foregroundColor(detailTab == .reviews ? .primary : .secondary)
                                    }
                                    Spacer()
                                }
                                .padding(.vertical, 12)

                                // 탭 언더라인
                                GeometryReader { g in
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundStyle(.quaternary)

                                        Rectangle()
                                            .frame(width: g.size.width / 2, height: 2)
                                            .foregroundColor(.black)
                                            .offset(x: detailTab == .info ? 0 : g.size.width / 2, y: -0.5)
                                            .animation(.easeInOut(duration: 0.2), value: detailTab)
                                    }
                                }
                                .frame(height: 2)
                            }

                            // 탭 컨텐츠
                            Group {
                                if detailTab == .info {
                                    // 상세 정보
                                    HStack(alignment: .top, spacing: 13) {
                                        Image(movie.poster)
                                            .resizable()
                                            .frame(width: 100, height: 120)
                                        VStack(alignment: .leading, spacing: 9) {
                                            if let age = movie.ageRating {
                                                Text(age)
                                                    .font(.PretendardSemiBold13)
                                                    .foregroundColor(.primary)
                                            }
                                            if let date = movie.releaseDate {
                                                Text(date)
                                                    .font(.PretendardSemiBold13)
                                                    .foregroundStyle(.primary)
                                            }
                                        }
                                        Spacer()
                                    }
                                    .frame(alignment: .top)
                                } else {
                                    // 실관람평(플레이스홀더)
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.purple02, lineWidth: 1)
                                        .frame(height: 141)
                                        .overlay(
                                            Text("등록된 관람평이 없어요 😌")
                                                .font(.PretendardSemiBold18)
                                                .foregroundStyle(.black)
                                        )
                                }
                            }
                            .padding(.horizontal, 16)
                            .animation(.easeInOut(duration: 0.15), value: detailTab)
                        }
                    }
                    .padding(.bottom, 24)
                }
                .navigationTitle(movie.title)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button { dismiss() } label: {
                            ZStack {
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 36, height: 36)
                                Image(systemName: "arrow.left")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.black.opacity(0.85))
                            }
                            .shadow(color: .black.opacity(0.12), radius: 6, y: 2)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

// 미리보기
#Preview {
    HomeView()
}
