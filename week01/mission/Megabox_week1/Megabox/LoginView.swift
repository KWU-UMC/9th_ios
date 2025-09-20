import SwiftUI


struct LoginView: View {
   
    var body: some View {
        VStack{
            //Part1 - 로그인 글씨
            Text("로그인").font(.PretendardSemiBold24).foregroundColor(.black)
            Spacer(minLength: 44)
            
            //Part2 - 로그인 영역
            VStack{
                VStack(spacing: 40){ //Part2.1 - id,pw
                    //id
                    VStack(alignment: .leading, spacing: 6) {
                        Text("아이디").font(.PretendardMedium16).foregroundColor(.gray03)
                        Rectangle().frame(height: 1).foregroundColor(.gray02)
                    }
                    
                    //pw
                    VStack(alignment: .leading, spacing: 6) {
                        Text("비밀번호").font(.PretendardMedium16).foregroundColor(.gray03)
                        Rectangle().frame(height: 1).foregroundColor(.gray02)
                    }
                }
                Spacer(minLength: 75)
                
                VStack{ //2.2 - Login Button & 회원가입
                    Button(action: {}) {
                        Text("로그인").font(.PretendardBold18).foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 54)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.purple04))
                    }
                    .shadow(color: .black.opacity(0.25),radius: 12, x: 0, y: 8)
                    // 회원가입
                    Text("회원가입").font(.PretendardMedium13).foregroundColor(.gray04)
                }
                Spacer(minLength: 17)
                
                HStack{ //2.3 아이콘 3개 넣기
                    Spacer().frame(width: 71)   // 왼쪽 여백
                    
                    Image("naver")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    Spacer()  // 네이버 ↔ 카카오 자동 간격
                    
                    Image("kakao")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    Spacer()  // 카카오 ↔ 애플 자동 간격
                    
                    Image("apple")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    Spacer().frame(width: 71)   // 오른쪽 여백
                    
                }
                .frame(maxWidth: .infinity) // 부모 기준으로 꽉 차게
                
            }
            .frame(height: 323)   // ← 여기서 전체 VStack 높이를 323pt로 고정
            Spacer(minLength: 17)
            
            // Part3 - 하단 사진 (이게 과제 요구사항)
            Image("umc_image").resizable().scaledToFill().frame(width: 408, height: 266)
            
            //수정한 버전 이게 더 이쁘게 나옴
            /*Image("umc_image")
                .resizable()
                .scaledToFit() // 비율 유지하면서 가로에 맞춤
                .frame(maxWidth: .infinity) // 부모 너비 기준으로 채움
                .frame(height: 266)         // 높이 고정
                .padding(.horizontal, 16)   // ← 여기서 여백 적용
             */

            
        }
        
        .padding(.horizontal, 16) // ← 여기서 좌우 16pt 여백 적용
    }
}

#Preview {
    LoginView()
}
