import SwiftUI


struct UserInfoView: View {
    
    
    @Environment(UserViewModel.self) private var userViewModel
    @State private var newUsername: String = ""

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        
        VStack{
            
            NavigaionView
                .padding(.bottom, 53)
            basicInfo
        
            
            
            
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true) 
        
        
    }
    
    
    private var NavigaionView: some View {
        ZStack {
            HStack {
                Text("회원정보 관리")
                    .font(.medium16)
                    .foregroundColor(.black)
            }
            
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                })
                
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
            
           
            Text("\(userViewModel.username)")
                .foregroundColor(.black)
            Divider()
                .foregroundColor(Color("grey02"))
                .padding(.bottom, 24)
            
            HStack
            {
                TextField("아이디", text: $newUsername)
                    .foregroundColor(.black)
                
                Button(action: {
                    print("변경")
                    userViewModel.saveUsername(newUsername: newUsername)
                    
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
    


 


#Preview {
    UserInfoView().environment(UserViewModel())

}
