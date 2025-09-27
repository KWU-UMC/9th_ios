// LoginViewModel.swift

import Foundation
import SwiftUI

@Observable
class LoginViewModel {

    func login(username: String, password: String) {
        // 뷰모델이 직접 자신의 프로퍼티에 접근하여 로그인 로직 처리
        print("뷰모델의 데이터로 로그인 시도:")
        print("아이디 - \(username), 비밀번호 - \(password)")
    }
}
