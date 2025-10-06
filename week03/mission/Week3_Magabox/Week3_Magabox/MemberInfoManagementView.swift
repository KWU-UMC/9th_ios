//
//  MemberInfoManagementView.swift
//  Megabox_2
//
//  Created by 최우진 on 9/26/25.
//

import SwiftUI

struct MemberInfoManagementView: View {
    // 커스텀 뒤로가기 버튼을 위한 환경 변수
    @Environment(\.dismiss) var dismiss
    
    // AppStorage 변수 선언
    @AppStorage("savedId") private var savedId: String = "cwj1213"
    @AppStorage("savedPassword") private var savedPassword: String = "1111"
    @AppStorage("userName") private var userName: String = "최우진"
    
    // TextField의 입력을 실시간으로 받기 위한 @State 변수
    @State private var nameInput: String = ""
    
    var body: some View {
        // 1. 가장 큰 VStack
        VStack(spacing: 53) {
            
            // 2. 상단 네비게이션 바 (HStack)
            HStack(spacing:0) {
                // 커스텀 뒤로가기 버튼
                Button(action: {
                    dismiss() // 이 버튼을 누르면 이전 화면으로 돌아갑니다.
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Text("회원정보 관리")
                    .font(.PretendardMedium16)
                
                Spacer()
            }
          
            
            
            // 3. 기본정보 파트 (VStack)
            VStack(alignment: .leading, spacing: 26) {
                Text("기본정보")
                    .font(.PretendardBold18)
                
                // 아이디 (Text 처리)
                VStack(alignment: .leading, spacing: 3) {
                    Text(savedId)
                        .foregroundColor(.black).font(.PretendardMedium18)
                    Divider().background(Color.gray02)
                }
                
                // 이름 (TextField + 변경 버튼)
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        TextField("이름", text: $nameInput).font(.PretendardMedium18)
                        
                        // 이름 변경 버튼
                        Button(action: {
                            // TextField에 입력된 값을 AppStorage에 저장
                            userName = nameInput
                            
                        }) {
                            ZStack {
                                    // 1. 배경 레이어
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray03, lineWidth: 1)

                                    // 2. 상단 레이어
                                    Text("변경")
                                    .font(.PretendardMedium10)
                                        .foregroundColor(.gray03)
                                }.frame(width: 60, height: 28)
                        }
                    }
                    Divider().background(Color.gray02)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal,16) // 전체적인 좌우 여백
        .navigationBarBackButtonHidden(true) // SwiftUI의 기본 뒤로가기 버튼 숨기기
        .onAppear {
            // 이 화면이 나타날 때, AppStorage에 저장된 이름을 TextField에 미리 채우도록 설정
            nameInput = userName
        }
    }
}

#Preview {
    NavigationStack {
        MemberInfoManagementView()
    }
}
