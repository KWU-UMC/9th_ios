import SwiftUI

struct Tabs: View {
    @State private var selectedTab = 0
    
    @Environment(UserViewModel.self) private var userViewModel

    
    var body: some View {
        
        TabView(selection: $selectedTab){
            
            
            HomeView()
                       .tabItem {
                           Image(systemName: "house.fill")
                           Text("홈")
                       }
                       .tag(0) // 첫 번째 탭의 태그

            Text("바로 예매")
                       .tabItem {
                           Image(systemName: "movieclapper")
                           Text("바로 예매")
                       }
                       .tag(1) // 두 번째 탭의 태그

            Text("모바일 오더")
                       .tabItem {
                           Image(systemName: "popcorn")
                           Text("모바일오더")
                       }
                       .tag(2) // 세 번째 탭의 태그
            
            NavigationStack {
                        ProfileView()
                    }
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("마이 페이지")
                    }
                    .tag(3)
                }
                .navigationBarBackButtonHidden(true)

        
        
    }
}

#Preview {
    Tabs().environment(UserViewModel())
}



