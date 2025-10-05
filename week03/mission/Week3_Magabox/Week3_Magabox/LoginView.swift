import SwiftUI

struct LoginView: View {
    // ViewModel: 아이디/비밀번호 입력을 보관
    @State private var viewModel = LoginViewModel()
    // 로컬 저장 자격(예시용): 실제 앱에서는 보안 저장소로 대체 권장
    @AppStorage("savedId") private var savedId: String = "cwj1213"
    @AppStorage("savedPassword") private var savedPassword: String = "1111"

    // 로그인 성공 시 화면 전환 트리거
    @State private var goHome = false

    var body: some View {
        NavigationStack {
            VStack {
                // MARK: - 상단 타이틀
                Text("로그인")
                    .font(.PretendardSemiBold24)
                    .foregroundColor(.black)
                Spacer(minLength: 44)

                // MARK: - 로그인 입력 영역
                VStack {
                    // 아이디 / 비밀번호 필드
                    VStack(spacing: 40) {
                        // 아이디
                        VStack(alignment: .leading, spacing: 6) {
                            TextField("아이디", text: $viewModel.id)
                                .font(.PretendardMedium16)
                                .foregroundColor(.gray03)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray02)
                        }

                        // 비밀번호
                        VStack(alignment: .leading, spacing: 6) {
                            SecureField("비밀번호", text: $viewModel.pwd)
                                .font(.PretendardMedium16)
                                .foregroundColor(.gray03)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray02)
                        }
                    }

                    Spacer(minLength: 75)

                    // MARK: - 로그인 버튼 / 회원가입
                    VStack {
                        // 로그인: 입력값이 저장값과 동일할 때만 goHome = true
                        Button {
                            if viewModel.id == savedId && viewModel.pwd == savedPassword {
                                goHome = true
                            } else {
                                // 불일치 시 추가 피드백(알림/토스트 등) 필요하면 여기서 처리
                            }
                        } label: {
                            Text("로그인")
                                .font(.PretendardBold18)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 54)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.purple04)
                                )
                        }
                        .shadow(color: .black.opacity(0.25), radius: 12, x: 0, y: 8)

                        // 내비게이션: goHome == true일 때 HomeView로 푸시
                        .navigationDestination(isPresented: $goHome) {
                            HomeView()
                                .navigationBarBackButtonHidden(true)
                        }

                        // (플레이스홀더) 회원가입 링크 텍스트
                        Text("회원가입")
                            .font(.PretendardMedium13)
                            .foregroundColor(.gray04)
                    }

                    Spacer(minLength: 17)

                    // MARK: - 소셜 아이콘 3종
                    HStack {
                        Spacer().frame(width: 71)
                        Image("naver").resizable().scaledToFit().frame(width: 40, height: 40)
                        Spacer()
                        Image("kakao").resizable().scaledToFit().frame(width: 40, height: 40)
                        Spacer()
                        Image("apple").resizable().scaledToFit().frame(width: 40, height: 40)
                        Spacer().frame(width: 71)
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 323)

                Spacer(minLength: 17)

                // MARK: - 하단 배너 이미지
                Image("umc_image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 408, height: 266)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    LoginView()
}
