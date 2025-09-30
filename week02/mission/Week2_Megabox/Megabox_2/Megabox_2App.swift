//
//  Megabox_2App.swift
//  Megabox_2
//
//  Created by 최우진 on 9/26/25.
//

import SwiftUI

@main
struct MegaboxApp: App {
    @State private var showLogin = true

    var body: some Scene {
        WindowGroup {
            if showLogin {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showLogin = false
                        }
                    }
            }
            else {
                LoginView()
            }
        }
    }
}
