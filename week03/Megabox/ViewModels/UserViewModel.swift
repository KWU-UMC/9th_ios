//여기서는 사용자 정보만 처리
import Foundation
import SwiftUI

@Observable
class UserViewModel {
    var username: String = ""
    var password: String = ""
    var isLoggedIn: Bool = false
    
    private let usernameKey = "username"
    private let passwordKey = "password"
    
    init() {
        self.username = UserDefaults.standard.string(forKey: usernameKey) ?? ""
        self.password = UserDefaults.standard.string(forKey: passwordKey) ?? ""
    }
    
    func saveUsername(newUsername: String) {
        UserDefaults.standard.set(newUsername, forKey: usernameKey)
        self.username = newUsername
        print("\(newUsername)으로 이름 변경 및 저장 완료")
    }
    
    func saveCredentials(username: String, password: String) {
        UserDefaults.standard.set(username, forKey: usernameKey)
        UserDefaults.standard.set(password, forKey: passwordKey)
        self.username = username
        self.password = password
        print("아이디와 비밀번호 저장 완료")
    }
}
