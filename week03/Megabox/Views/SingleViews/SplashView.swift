// SplashView.swift

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    // MegaboxApp에서 전달받은 userViewModel을 그대로 사용합니다.
    @Environment(UserViewModel.self) private var userViewModel

    var body: some View {
        // ZStack을 사용하여 스플래시 이미지를 배경에, 전환 로직을 위에 둡니다.
        ZStack {
            if isActive {
                // isActive가 true가 되면 ContentView를 보여줍니다.
                ContentView()
            } else {
                // 스플래시 화면 UI (예시)
                
                Image("meboxLogo 1")
                    .frame(width: 249, height: 84)
                    .background(Color.white)

               
            }
        }
        .onAppear {
            // 뷰가 나타나고 2초 후에 isActive 상태를 true로 변경합니다.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

