import SwiftUI


struct UserInfoView: View {
    
    
    @AppStorage("username") private var username: String = ""
    @State private var newUsername: String = ""

 
    var body: some View {
        
        VStack{
            
            NavigaionView
                .padding(.bottom, 53)
            basicInfo
        
            
            
            
            
            Spacer()
        }
        
        
    }
    
    
    private var NavigaionView: some View{
        
        
       
        ZStack {
            
            HStack {
                Text("회원정보 관리")
                    .font(.medium16)
                    .foregroundColor(.black)
            }
            
            
            HStack {
                makeBackward(name: "arrow.backward")
                
                Spacer()
            }
            
        }
        .padding(.horizontal, 16)
        .frame(height: 44)
    }
    
    private var basicInfo: some View {
        
        
        VStack(alignment: .leading){
            
            Text("기본정보")
                .foregroundColor(.black)
                .padding(.bottom, 26)
            
           
            Text("\(username)")
                .foregroundColor(.black)
            Divider()
                .foregroundColor(Color("grey02"))
                .padding(.bottom, 24)
            
            HStack
            {
                TextField("아이디", text: $newUsername)
                    .foregroundColor(.black)
                
                Button(action: {
                          
                  username = newUsername
                    
                      }) {
                          Text("변경")
                              .font(.system(size: 18, weight: .bold))
                              .foregroundColor(.gray)
                              .padding(.horizontal, 40)
                              .padding(.vertical, 12)
                      }
                      .overlay(
                          Capsule() // 피그마 dev모드가 막혀서 그냥 임의로 했습니다
                            .stroke(.grey03, lineWidth: 2)
                      )
                
                
            }
                Divider()
                    .foregroundColor(Color("grey02"))
                    .padding(.bottom, 24)
            
            
        }
        .padding(.horizontal, 16)
        
        
        
        
        
    }


    }
    
    private func makeBackward(name: String) -> some View{
        
        Button(action: {
            
            print("ProfileView로 이동")
            
        }, label: {
            Image(systemName: name)
                .foregroundColor(.black)
                
            
        })
        
        
        
        
    }


 


#Preview {
    UserInfoView()
}
