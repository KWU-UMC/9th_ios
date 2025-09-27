import SwiftUI

struct LoginView: View {
    
    @Environment(LoginViewModel.self) private var viewModel

    @AppStorage("username") private var username: String = ""
    @AppStorage("password") private var password: String = ""
    
    var body: some View {
        VStack{
            
            // 상단 네비게이션
            navigationBar
            // 입력 섹션
            Spacer(minLength: 44)
            personalInfo
            // 로그인 버튼
            Spacer(minLength: 75)
            LoginButton
            
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
              
        
        
    }
    
    private var navigationBar: some View{
        
        ZStack{
            Spacer()
            Text("로그인")
                .font(.semiBold24)
                .foregroundColor(.black)
            Spacer()
            
        }
        
        
        
        
    }

    private var personalInfo: some View {
        
        return VStack(spacing: 40) {
            VStack(alignment: .leading, spacing: 8) {
                TextField("아이디", text: $username)
                    .foregroundColor(Color("grey03"))
                Divider()
                    .foregroundColor(Color("grey02"))
            }

            VStack(alignment: .leading, spacing: 8) {
                SecureField("비밀번호", text: $password)
                    .foregroundColor(Color("grey03"))
                Divider()
                    .foregroundColor(Color("grey02"))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    
    private var LoginButton: some View {
        Button(action: {
            
            viewModel.login(username: username, password: password)
            
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
            .resizable() // 이미지는 고유의 크기를 가지고 있기 때문에 frame이 안먹힘
        //
            
        
        
    }
        
}

#Preview {
    LoginView().environment(LoginViewModel())
           
        
}
