import SwiftUI

struct LoginView: View {

 
       @Environment(UserViewModel.self) private var userViewModel
       //여기다가 먼저 저장한다음, 로그인이 될때 그 정보를 전역으로 전달
       @State private var loginViewModel: LoginViewModel?
    
       @State private var usernameInput: String = ""
       @State private var passwordInput: String = ""

    
    var body: some View {
        ScrollView{
            VStack{
                
                // 상단 네비게이션
                navigationBar
                // 입력 섹션
                Spacer(minLength: 44)
                personalInfo
                // 로그인 버튼
                Spacer(minLength: 75)
                loginButton
                
                Spacer(minLength: 17)
                newId
                
                Spacer(minLength: 35)
                SocialLogin
                
                Spacer(minLength: 39)
                UMCPoster
                
                Spacer(minLength: 100)
                
            }
            .padding(.top, 16)
            .padding(.horizontal,16)
            .onAppear {
           
                self.loginViewModel = LoginViewModel(userViewModel: userViewModel)
            }
            
            
            
        }
    }
    
    private var navigationBar: some View{
        
        HStack{
            Spacer()
            Text("로그인")
                .font(.semiBold24)
                .foregroundColor(.black)
            Spacer()
            
        }
        .frame(height: 44)
        
        
        
        
    }

    private var personalInfo: some View {
        
        return VStack(spacing: 40) {
            VStack(alignment: .leading, spacing: 8) {
                TextField("아이디", text: $usernameInput)
                    .foregroundColor(Color("grey03"))
                Divider()
                    .foregroundColor(Color("grey02"))
            }

            VStack(alignment: .leading, spacing: 8) {
                SecureField("비밀번호", text: $passwordInput)
                    .foregroundColor(Color("grey03"))
                Divider()
                    .foregroundColor(Color("grey02"))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    
    private var loginButton: some View {
        Button(action: {
            
            
            loginViewModel?.login(username: usernameInput, password: passwordInput)

            
        }) {
            Text("로그인")
                .font(.bold18)
                .foregroundColor(Color("White"))
                .frame(maxWidth: .infinity)   // 텍스트가 가운데 오도록
        }
        .frame(height: 54)
        .background(Color("purple03"))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 4)

    }
    
    private var newId: some View{
        
        Button(action:{
            print("회원가입")
        }){
            
            Text("회원가입")
                .font(.medium13)
                .foregroundColor(Color("grey04"))
                
        }
       
        
        
    }
    
    private var SocialLogin: some View {
        HStack(spacing:73){
            
            Image("Naver")
            Image("Kakao")
            Image("Apple")
            
        }
        
        
        
    }
    
    private var UMCPoster: some View{
        
        Image("umc 1")
            .resizable()
           
        
        
    }
        
}

#Preview {
    LoginView().environment(UserViewModel())
           
        
}
