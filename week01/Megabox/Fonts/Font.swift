//
//  FontManager.swift
//  Megabox
//
//  Created by 엄지용 on 9/20/25.
//
import SwiftUI

extension Font {
    enum Pretend {
        
        case extra
        case bold
        case semi
        case medium
        case regular
        case light
                
        var value: String {
                    switch self {
                    case .extra:
                        return "Pretendard-ExtraBold"
                    case .bold:
                        return "Pretendard-Bold"
                    case .semi:
                        return "Pretendard-SemiBold"
                    case .medium:
                        return "Pretendard-Medium"
                    case .regular:
                        return "Pretendard-Regular"
                    case .light:
                        return "Pretendard-Light"
                    }
                }
        
    }
    
    static func pretend(type: Pretend, size: CGFloat) -> Font {
            return .custom(type.value, size: size)
        }
        
    static var extraBold24: Font{
        return .pretend(type: .extra, size:24)
    }
    
    
    static var bold18: Font{
        return .pretend(type: .bold, size:18)
    }
    static var bold22: Font{
        return .pretend(type: .bold, size:22)
    }
    
    static var bold24: Font{
        return .pretend(type: .bold, size:24)
    }
    
    
    static var semiBold38: Font{
        return .pretend(type: .semi, size:38)
    }
    static var semiBold24: Font{
        return .pretend(type: .semi, size:24)
    }
    static var semiBold18: Font{
        return .pretend(type: .semi, size:18)
    }
    static var semiBold16: Font{
        return .pretend(type: .semi, size:16)
    }
    static var semiBold14: Font{
        return .pretend(type: .semi, size:14)
    }
    static var semiBold13: Font{
        return .pretend(type: .semi, size:13)
    }
    static var semiBold12: Font{
        return .pretend(type: .semi, size:12)
    }
    
    
    static var regular20: Font{
        return .pretend(type: .regular, size: 20)
    }
    static var regular18: Font{
        return .pretend(type: .regular, size: 18)
    }
    static var regular13: Font{
        return .pretend(type: .regular, size: 13)
    }
    static var regular12: Font{
        return .pretend(type: .regular, size: 12)
    }
    

    static var medium18: Font{
        return .pretend(type: .medium, size: 18)
    }
    static var medium16: Font{
        return .pretend(type: .medium, size: 16)
    }
    static var medium14: Font{
        return .pretend(type: .medium, size: 14)
    }
    static var medium13: Font{
        return .pretend(type: .medium, size: 13)
    }
    static var medium10: Font{
        return .pretend(type: .medium, size: 10)
    }
    static var medium8: Font{
        return .pretend(type: .medium, size: 8)
    }
    
    
    
    static var light14: Font{
        return .pretend(type: .light, size: 14)
    }


    

    

    
    
    
    
    
    
    
    
}

