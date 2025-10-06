// ContentView.swift (기존 NavigationView.swift)

import SwiftUI

struct ContentView: View {
    
    @Environment(UserViewModel.self) private var userViewModel

    var body: some View {
        // userViewModel의 isLoggedIn 값에 따라 보여줄 뷰를 결정
        if userViewModel.isLoggedIn {
    
            NavigationStack {
                Tabs()
            }
        } else {
            NavigationStack {
                LoginView()
            }
        }
    }
}
