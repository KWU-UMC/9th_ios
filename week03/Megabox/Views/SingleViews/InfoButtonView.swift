import SwiftUI
struct InfoButton: View {
    let title: String
    let type: InfoType
    @Binding var selectedInfo: InfoType
    
    var isSelected: Bool {
        selectedInfo == type
    }
    
    var body: some View {
        Button(action: {
            // 버튼을 누르면 상태를 자신의 type으로 변경
            selectedInfo = type
        }) {
            VStack(spacing: 8) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(isSelected ? .black : .gray)
                
                if isSelected {
                    Capsule()
                        .frame(height: 3)
                        .foregroundColor(.black)
                } else {
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(.clear)
                }
            }
            .padding(.vertical, 8)
        }
    }
}
