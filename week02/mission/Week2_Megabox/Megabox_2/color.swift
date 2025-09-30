//
//  color.swift
//  Megabox
//
//  Created by 최우진 on 9/20/25.
//

import Foundation
import SwiftUI

extension Color {
    // 1) 이니셜라이저를 Color.swift로 옮기고, 팔레트보다 위에 둡니다.
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(.sRGB,
                  red:   Double((hex >> 16) & 0xFF) / 255.0,
                  green: Double((hex >>  8) & 0xFF) / 255.0,
                  blue:  Double( hex        & 0xFF) / 255.0,
                  opacity: alpha)
    }

    // 2) 팔레트 정의
    // Blue
    static let blue00 = Color(hex: 0xE5EAFA as UInt)
    static let blue01 = Color(hex: 0xFFFFFF as UInt)
    static let blue02 = Color(hex: 0xE3E9F5 as UInt)
    static let blue03 = Color(hex: 0x8AAAD6 as UInt)
    static let blue04 = Color(hex: 0x6C94C3 as UInt)
    static let blue05 = Color(hex: 0x5C85B9 as UInt)
    static let blue06 = Color(hex: 0x466F9E as UInt)
    static let blue07 = Color(hex: 0x2F567F as UInt)
    static let blue08 = Color(hex: 0x1E3C60 as UInt)
    static let blue09 = Color(hex: 0x132847 as UInt)

    // Purple
    static let purple00 = Color(hex: 0xF5E8FF as UInt)
    static let purple01 = Color(hex: 0xE4C8FF as UInt)
    static let purple02 = Color(hex: 0xC49CFF as UInt)
    static let purple03 = Color(hex: 0x9C6EFF as UInt)
    static let purple04 = Color(hex: 0x6F2CFF as UInt) // 버튼 색
    static let purple05 = Color(hex: 0x5C23CC as UInt)
    static let purple06 = Color(hex: 0x491A99 as UInt)
    static let purple07 = Color(hex: 0x371266 as UInt)
    static let purple08 = Color(hex: 0x240933 as UInt)
    static let purple09 = Color(hex: 0x1A0020 as UInt)

    // Grey
    static let gray00 = Color(hex: 0xF8F9FA as UInt)
    static let gray01 = Color(hex: 0xF1F3F5 as UInt)
    static let gray02 = Color(hex: 0xE5E5EA as UInt)
    static let gray03 = Color(hex: 0xD1D5DB as UInt)
    static let gray04 = Color(hex: 0x9CA3AF as UInt)
    static let gray05 = Color(hex: 0x6B7280 as UInt)
    static let gray06 = Color(hex: 0x4B5563 as UInt)
    static let gray07 = Color(hex: 0x374151 as UInt)
    static let gray08 = Color(hex: 0x1F2937 as UInt)
    static let gray09 = Color(hex: 0x111827 as UInt)

    // White / Black (토큰)
    static let White = Color.white
    static let Black = Color.black
}

