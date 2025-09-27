

import SwiftUI




struct ProfileView: View {

    
    @AppStorage("username") private var username: String = ""

    
    
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
                
                Text("\(username)님")
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
                
                Button(action: {
                    
                    print("회원정보로 넘어가기")
                    
                }, label: {
                    
                    Text("회원정보")
                        .font(.semiBold14)
                        .foregroundColor(.white)
                        .padding(.horizontal, 11.5)
                        .padding(.vertical, 4)
                        .background(.grey07)
                        .cornerRadius(16)
                    
                    
                    
                })
              
                
                
                
                
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
            
            VStack(spacing: 9) {
                Text("쿠폰")
                    .foregroundColor(.grey02)
                
                Text("2")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            
            
            Divider()
                .frame(height: 40) // Divider 높이 조절
            
                
            VStack(spacing: 9) {
                Text("스토어 교환권")
                    .foregroundColor(.grey02)
                
                Text("0")
            }
            .frame(maxWidth: .infinity) //maxWidth로 수정
            .frame(height: 52)
                
            Divider()
                .frame(height: 40)
                
            VStack(spacing: 9) {
                Text("모바일 티켓")
                    .foregroundColor(.grey02) 
                
                Text("0")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
                
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
            
            VStack(spacing: 12){
                Image("영화별예매")
                Text("영화별예매")
                    .foregroundColor(.black)
                
                
                
                
            }
            .frame(maxWidth:.infinity)
            
            VStack(spacing: 12){
                Image("극장별예매")
                Text("극장별예매")
                    .foregroundColor(.black)
                
                
                
                
            }
            .frame(maxWidth:.infinity)
            VStack(spacing: 12){
                Image("특별관예매")
                Text("특별관예매")
                    .foregroundColor(.black)
                
                
                
                
            }
            .frame(maxWidth:.infinity)
            VStack(spacing: 12){
                Image("모바일오더")
                Text("모바일오더")
                    .foregroundColor(.black)
                
                
                
                
            }
            .frame(maxWidth:.infinity)
           
            
            
            
            
        }.padding(.horizontal, 16)
        
        
        
        
    }
        
        
        
        
    }

 


    



#Preview {
    ProfileView()
}
