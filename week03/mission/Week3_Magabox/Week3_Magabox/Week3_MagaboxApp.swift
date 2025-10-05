//
//  Week3_MagaboxApp.swift
//  Week3_Magabox
//
//  Created by 최우진 on 10/2/25.
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
