//
//  MegaboxApp.swift
//  Megabox
//
//  Created by 엄지용 on 9/19/25.
//

import SwiftUI

@main
struct MegaboxApp: App {
    @State private var userViewModel = UserViewModel() // 이 객체 생성하고 State로 메모리에 유지
    var body: some Scene {
        
        WindowGroup {
            SplashView()
                .environment(userViewModel)
        }
    }
}
