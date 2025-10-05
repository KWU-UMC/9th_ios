//
//  LoginViewModel.swift
//  Megabox
//
//  Created by 최우진 on 9/25/25.
//

// LoginViewModel.swift

import Foundation
import Observation


@Observable //전역으로 사용할 수 있도록 설정
class LoginViewModel {
    var loginModel = LoginModel()

    var id: String {
        get { loginModel.id }
        set { loginModel.id = newValue }
    }

    var pwd: String {
        get { loginModel.pwd }
        set { loginModel.pwd = newValue }
    }
}
