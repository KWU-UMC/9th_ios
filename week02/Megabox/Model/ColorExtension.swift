
import SwiftUI


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") 
        var rgb: UInt64 = 0
        // hex값을 64비트 정수로 스캔
        scanner.scanHexInt64(&rgb)
        
        // rgb 값에서 red, green, blue 요소를 추출
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
