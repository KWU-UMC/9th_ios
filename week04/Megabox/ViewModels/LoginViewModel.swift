// LoginViewModel.swift

import Foundation
import SwiftUI

@Observable
class LoginViewModel {
   
    private var userViewModel: UserViewModel
    
    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
    }
    
    // 로그인 성공 여부를 Bool 값으로 반환
    func login(username: String, password: String) {
        if username == "Eom175" && password == "eom175" {
            print("로그인 성공!")
            // 로그인 성공 시, 공유 userViewModel의 상태를 변경
            userViewModel.username = username 
            userViewModel.isLoggedIn = true
        } else {
            print("로그인 실패: 아이디 또는 비밀번호가 다릅니다.")
        }
    }
}
