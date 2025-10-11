// MovieCardView.swift

import SwiftUI

struct MovieCardView: View {
    
    let movie: MovieCards
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // 1. 영화 포스터 이미지
            movie.image
                .resizable()
                .scaledToFit()
                .frame(width: 148, height: 212)

               
            
            // 2. 예매 버튼
            bookingButton
            
            // 3. 영화 정보 텍스트
            VStack(alignment: .leading, spacing: 2) {
                Text(movie.movieName)
                    .font(.bold22)
                    .foregroundColor(.black)
                
                Text("누적관객수 \(movie.watchedStatus)")
                    .font(.medium18)
                    .foregroundColor(.black)
            }
        }
        .frame(width: 148, height:318) // 카드 전체의 너비 고정
    }
    
    // 예매 버튼 UI
    private var bookingButton: some View {
        Button(action: {
            print("\(movie.movieName) 예매하기")
        }) {
            Text("바로 예매")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.purple03)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 9)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.purple03).opacity(0.5), lineWidth: 1)
                )
        }
    }
}
