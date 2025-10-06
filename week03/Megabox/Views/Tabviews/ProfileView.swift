

import SwiftUI




struct ProfileView: View {

    
    @Environment(UserViewModel.self) private var userViewModel

    
    
    var body: some View {
        
     
            
        VStack(spacing: 33){
                
                profileHeader
                
                membershipButton
                
                statusView
            
                imageView
            
                Spacer()
                
                
            }
            
        
    }
    
    
    private var profileHeader: some View {
        
        VStack(alignment: .leading){
            HStack{
                
                Text("\(userViewModel.username)님")
                    .font(.bold24)
                    .foregroundColor(.black)
                    .padding(.trailing, 5)
                
                
                Text("WELCOME")
                    .font(.medium14)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.tag)
                    .cornerRadius(6)
                
                
                Spacer()
                
                NavigationLink {
                              
                UserInfoView()
                } label: {
                               // 버튼의 모양은 그대로 유지됩니다.
                               Text("회원정보")
                                   .font(.semiBold14)
                                   .foregroundColor(.white)
                                   .padding(.horizontal, 11.5)
                                   .padding(.vertical, 4)
                                   .background(.grey07)
                                   .cornerRadius(16)
                           }
                       }
                       .padding(.horizontal, 16)
            
            
            HStack(spacing: 9)
            {
                Text("멤버십 포인트")
                    .font(.medium14)
                .foregroundColor(.grey04)
                          
                Text("500P")
                    .font(.semiBold18)
                .foregroundColor(.black)
                
            }
            .padding(.horizontal, 16) // 전체적인 좌우 여백

            
            
        }
        
        
    }
    
    
    private var membershipButton: some View{
        
        
        Button(action: {
            
            print("멤버십화면으로 이동")
            
            
        }, label: {
            HStack(spacing: 4) {
                Text("클럽 멤버십")
                    .font(.system(size: 16, weight: .bold))
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .bold))
            }
            .foregroundColor(.white)
            
            
            
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 12)
        .frame(height: 46)
        .background(
                LinearGradient(
                    stops:
                    [
                        .init(color: Color(hex:"AB8BFF"), location: 0.00),
                        .init(color: Color(hex:"8EAEF3"), location: 0.53),
                        .init(color: Color(hex:"5DCCEC"), location: 1.00),
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(8)
            .padding(.horizontal, 16)
        
               
               
         
    
        
        
    }
    
    private var statusView: some View {
        HStack {
            
            statusCards(name: "쿠폰", num: 2)
            
            
            Divider()
                .frame(height: 40) // Divider 높이 조절
            
            statusCards(name: "스토어 교환권", num: 0)
            
            Divider()
                .frame(height: 40)
                
            
            statusCards(name: "모바일 티켓", num: 0)
                
        }
        .padding(.vertical, 12)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.grey02, lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
    
    

    private var imageView: some View{
        
        HStack{
            
          imageView(section: "영화별 예매")
          imageView(section: "극장별 예매")

          imageView(section: "특별관 예매")

          imageView(section: "모바일 오더")
            
            
            
            
        }.padding(.horizontal, 16)
        
        
        
        
    }
    
    private func imageView(section:String) -> some View{
        
        
        VStack(spacing: 12){
            Image(section)
            Text(section)
                .foregroundColor(.black)
            
        }
        .frame(maxWidth:.infinity)
        
        
        
        
    }
        
        
    private func statusCards(name: String, num: Int) -> some View{
        
        VStack(spacing: 9) {
            Text(name)
                .foregroundColor(.grey02)
            
            Text("\(num)")
        }
        .frame(maxWidth: .infinity)
        .frame(height: 52)
        
        
    }
    
    
        
    }

 


    



#Preview {
    ProfileView().environment(UserViewModel())

}
