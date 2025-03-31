import SwiftUI

class OtherViewModel: ObservableObject{
    // ObservableObject : 이 안의 값이 바뀌면 뷰도 자동으로 업데이트됨
    @AppStorage("nickname") var nickname: String = ("(작성한 닉네임)")
    //@AppStorage: UserDefaults랑 연결된 값을 자동으로 동기화
    ///"nickname"이라는 키에 연결되어 있고 저장된 값이 없을 경우 기본값으로 "(작성한 닉네임)"을 사용
}
