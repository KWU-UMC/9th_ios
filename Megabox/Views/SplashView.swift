import SwiftUI

struct SplashView: View {
    @State private var isActive = false   // 화면 전환 상태

    var body: some View {
        ZStack {
            if isActive {
                LoginView()   // ✅ 일정 시간이 지나면 LoginView로 전환
            } else {
                Image("meboxLogo 1")
                    .frame(width: 249, height: 84)
                    .background(Color.white)
                    .onAppear {
                        // 2초 후 전환
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isActive = true
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    SplashView()
}
