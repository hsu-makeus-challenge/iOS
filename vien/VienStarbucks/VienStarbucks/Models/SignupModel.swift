import Foundation

@Observable //이 클래스가 SwiftUI 뷰에서 자동으로 상태 추적이 가능한 모델이 됨
            //즉, SwiftUI 뷰가 이 클래스의 nickname, email, password에 바인딩되면, 값이 바뀔 때 자동으로 뷰가 갱신됨
class SignupModel {
    var nickname: String = ""
    var email: String = ""
    var password: String = ""
}
