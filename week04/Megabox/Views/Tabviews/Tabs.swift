import SwiftUI

struct Tabs: View {
    @State private var selectedTab = 0
    
    // @Environment 프로퍼티는 그대로 유지합니다.
    @Environment(UserViewModel.self) private var userViewModel

    var body: some View {
        // TabView의 selection 바인딩은 그대로 사용합니다.
        TabView(selection: $selectedTab) {
            
            // 1. HomeView 탭
            Tab("홈", systemImage: "house.fill", value: 0) {
                HomeView()
            }
            
            // 2. "바로 예매" 탭
            Tab("바로 예매", systemImage: "movieclapper", value: 1) {
                Text("바로 예매")
            }
            
            // 3. "모바일 오더" 탭
            Tab("모바일오더", systemImage: "popcorn", value: 2) {
                Text("모바일 오더")
            }
            
            // 4. "마이 페이지" 탭
            Tab("마이 페이지", systemImage: "person.fill", value: 3) {
                NavigationStack {
                    ProfileView()
                }
            }
        }
        // 이 수정자는 TabView에 적용되는 것이므로 그대로 둡니다.
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Tabs().environment(UserViewModel())
}
