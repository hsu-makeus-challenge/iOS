import SwiftUI


//흠 text style을 보면 글자크기가 고정되어있으니까 다르게 써야하는거 같은데
// 스타일이름+사이즈고정 형태 : static var 형태로 하는게 쭈음
// (즉, 디자인 시스템에 사이즈/스타일이 고정되어 있고, 그 스타일을 반복해서 쓸거면 static var)
// https jangsh9611.tistory.com/24 처럼(또는 아래 pretendard처럼) 걍 스타일만 바뀐거면 enum패턴으로 정의후 이후에 사이즈 정의?
// (즉, 좀 더 유연하게 weight조합을 바꾸고 싶은 상황이라면 enum + 함수 방식 추천)

extension Font {
//    static var mainTextExtraBold24: Font { .custom("Pretendard-ExtraBold", size: 24) }
//    static var mainTextBold24: Font { .custom("Pretendard-Bold", size: 24) }
//    static var mainTextBold20: Font { .custom("Pretendard-Bold", size: 20) }
//    static var mainTextSemiBold24: Font { .custom("Pretendard-SemiBold", size: 24) }
//    static var mainTextSemiBold18: Font { .custom("Pretendard-SemiBold", size: 18) }
//    static var mainTextSemiBold16: Font { .custom("Pretendard-SemiBold", size: 16) }
//    static var mainTextSemiBold14: Font { .custom("Pretendard-SemiBold", size: 14) }
//    static var mainTextMedium16: Font { .custom("Pretendard-Medium", size: 16) }
//    static var mainTextRegular18: Font { .custom("Pretendard-Regular", size: 18) }
//    static var mainTextRegular13: Font { .custom("Pretendard-Regular", size: 13) }
//    static var mainTextRegular12: Font { .custom("Pretendard-Regular", size: 12) }
//    static var mainTextRegular09: Font { .custom("Pretendard-Regular", size: 9) }
//    static var mainTextLight14: Font { .custom("Pretendard-Light", size: 14) }
//    
//    // 버튼 전용
    //    static var makeMedium18: Font { .custom("Pretendard-Medium", size: 18) }
    enum Pretend {
        case extraBold
        case bold
        case semibold
        case medium
        case regular
        case light
        
        var value: String {
            switch self {
            case .extraBold:
                return "Pretendard-ExtraBold"
            case .bold:
                return "Pretendard-Bold"
            case .semibold:
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
    
}


//extension Font {
//    enum CustomFont {
//        case mainTextExtraBold24
//        case mainTextBold24
//        case mainTextBold20
//        case mainTextSemiBold24
//        case mainTextSemiBold18
//        case mainTextSemiBold16
//        case mainTextSemiBold14
//        case mainTextMedium16
//        case mainTextRegular18
//        case mainTextRegular13
//        case mainTextRegular12
//        case mainTextRegular09
//        case mainTextLight14
//        case makeMedium18
//
//        var value: Font {
//            switch self {
//            case .mainTextExtraBold24:
//                return .custom("Pretendard-ExtraBold", size: 24)
//            case .mainTextBold24:
//                return .custom("Pretendard-Bold", size: 24)
//            case .mainTextBold20:
//                return .custom("Pretendard-Bold", size: 20)
//            case .mainTextSemiBold24:
//                return .custom("Pretendard-SemiBold", size: 24)
//            case .mainTextSemiBold18:
//                return .custom("Pretendard-SemiBold", size: 18)
//            case .mainTextSemiBold16:
//                return .custom("Pretendard-SemiBold", size: 16)
//            case .mainTextSemiBold14:
//                return .custom("Pretendard-SemiBold", size: 14)
//            case .mainTextMedium16:
//                return .custom("Pretendard-Medium", size: 16)
//            case .mainTextRegular18:
//                return .custom("Pretendard-Regular", size: 18)
//            case .mainTextRegular13:
//                return .custom("Pretendard-Regular", size: 13)
//            case .mainTextRegular12:
//                return .custom("Pretendard-Regular", size: 12)
//            case .mainTextRegular09:
//                return .custom("Pretendard-Regular", size: 9)
//            case .mainTextLight14:
//                return .custom("Pretendard-Light", size: 14)
//            case .makeMedium18:
//                return .custom("Pretendard-Medium", size: 18)
//            }
//        }
//    }
//    
//    static func customFont(_ style: CustomFont) -> Font {
//        return style.value
//    }
//}
