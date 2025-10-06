import SwiftUI

struct MemberInfoView: View {
    // 로그인 뷰에서 저장한 아이디를 가져옵니다.
    @AppStorage("savedId") private var savedId: String = "cwj1213"
    @AppStorage("savedPassword") private var savedPassword: String = "1111"
    @AppStorage("userName") private var userName: String = "최우진"
   
    var body: some View {
        NavigationStack { //회원정보 View로 가도록
            VStack(spacing: 33) {
                HStack(alignment: .top) {
                    // 이름과 포인트를 담는 왼쪽 VStack
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing:5) {
                            Text(userName)
                                .font(.PretendardBold24)
                                .fontWeight(.bold)
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color(red: 48/255, green: 209/255, blue: 201/255))
                                Text("WELCOME")
                                    .font(.PretendardMedium14)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 81, height: 25)
                        }
                        HStack(spacing: 9) {
                            Text("멤버십 포인트")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Text("500P")
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                    }
                    Spacer()
                    // 회원정보 버튼
                    NavigationLink(destination: MemberInfoManagementView()) {
                        VStack {
                            Text("회원정보")
                                .font(.PretendardSemiBold14)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 4)
                        .frame(width: 72, height: 28)
                        .background(Color.gray07)
                        .cornerRadius(16)
                    }
                }
                VStack {
                    HStack(spacing : 3) {
                        Text("클럽 멤버십")
                            .font(.PretendardSemiBold16)
                            .foregroundColor(.white)
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14, weight: .semibold)) // 아이콘 크기/굵기 조절
                            .foregroundColor(.white.opacity(0.8))
                        
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)    // 상하 패딩 12pt (높이를 46pt로 만듦)
                .padding(.horizontal,8)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.67, green: 0.55, blue: 1),
                            Color(red: 0.56, green: 0.68, blue: 0.95),
                            Color(red: 0.36, green: 0.8, blue: 0.93)
                        ]),
                        //그라데이션 만들기
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(8)

                ZStack {
                    // 배경과 테두리
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .stroke(Color.gray02, lineWidth: 1)
                    
                    
                    HStack (spacing: 43){
                        VStack(spacing: 9) {
                            Text("쿠폰")
                                .font(.PretendardSemiBold16)
                                .foregroundColor(.gray02)
                            Text("2")
                                .font(.PretendardSemiBold18)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Divider().frame(height: 31)
                        
                        VStack(spacing: 9) {
                            Text("스토어 교환권")
                                .font(.PretendardSemiBold16)
                                .foregroundColor(.gray02)
                            Text("0")
                                .font(.PretendardSemiBold18)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Divider().frame(height: 31)
                        
                        VStack(spacing: 9) {
                            Text("모바일 티켓")
                                .font(.PretendardSemiBold16)
                                .foregroundColor(.gray02)
                            Text("0")
                                .font(.PretendardSemiBold18)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                }
                .frame(height: 76)

                HStack(alignment: .top, spacing: 16) {
                    VStack(spacing: 12) {
                        Image("film-reel")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 36)
                        Text("영화별예매")
                            .font(.PretendardMedium16)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack(spacing: 12) {
                        Image("map")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 36)
                        Text("극장별예매")
                            .font(.PretendardMedium16)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack(spacing: 12) {
                        Image("sofa")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 36)
                        Text("특별관예매")
                            .font(.PretendardMedium16)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack(spacing: 12) {
                        Image("cinema")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 36)
                        Text("모바일오더")
                            .font(.PretendardMedium16)
                    }
                    .frame(maxWidth: .infinity)
                    
                }
                
                Spacer()
            }
            .padding(.horizontal, 24) // ← 여기서 전체 좌우 16pt 여백 줌
            .padding(.vertical, 95)
            .background(Color(uiColor: .white)) // 전체 배경색
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MemberInfoView()
}
