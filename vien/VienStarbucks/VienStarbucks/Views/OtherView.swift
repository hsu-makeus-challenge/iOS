import SwiftUI

struct OtherView: View {
    @StateObject private var otherViewModel = OtherViewModel()
    
    @AppStorage("userNickname") var storedNickname: String = "(작성한 닉네임)"
    
    var body: some View {
        
        // 상단바
        HStack {
            Text("Other")
                .font(.mainTextBold24)
            
            Spacer().frame(width: 295)
            
            Button(action:{
                print("로그아웃")
            }) {
                Image("logoutDoor")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
        }
        .padding(.bottom, 16)
        
        VStack {
            
            Spacer().frame(height: 41)

            // 환영 메시지
            // 여기 글자 사이 스페이싱? 여백?? 이거 피그마에서 어떻게 확인하죠
            VStack {
                HStack {
                    Text("\(storedNickname)")
                        .foregroundColor(.green01)
                        .font(.mainTextSemiBold24)
                    
                    Text("님")
                        .foregroundColor(.black)
                        .font(.mainTextSemiBold24)
                }
                Text("환영합니다 🙌🏻")
                    .font(.mainTextSemiBold24)
            }
            
            Spacer().frame(height: 24)

            HStack{
                OtherButtonView(buttonImage: "other_star", buttonText: "별 히스토리")
                OtherButtonView(buttonImage: "other_receipt", buttonText: "전자영수증")
                OtherButtonView(buttonImage: "other_mymenu", buttonText: "나만의 메뉴")
            }
            
            Spacer().frame(height: 41)
            
            // 버튼 많은 구역
            // 여기 피그마에서 pdf파일 다운받으려고 하면 앱이 멈춰서 일단 미리 받아놨던 카드로 우선 사용
            VStack{
                
                //Pay 구역
                Text("Pay")
                    .font(.mainTextSemiBold18)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer().frame(height: 24)
                
                HStack{
                    PayandCustomerSupportView(buttonImage: "other_card", buttonText: "스타벅스 카드 등록")
                    
                    Spacer().frame(width: 104)
                    
                    PayandCustomerSupportView(buttonImage: "other_card_change", buttonText: "카드 교환권 등록")
                }
                
                Spacer().frame(height: 32)
                
                HStack{
                    PayandCustomerSupportView(buttonImage: "other_card", buttonText: "쿠폰 등록")
                    
                    Spacer().frame(width: 104)
                    
                    PayandCustomerSupportView(buttonImage: "other_card_change", buttonText: "쿠폰 히스토리")
                }
                
                Spacer().frame(height: 16)

                Divider()
                    .background(Color("gray00"))

                Spacer().frame(height: 41)

                //Customer Service 구역
                Text("고객지원")
                    .font(.mainTextSemiBold18)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer().frame(height: 24)
                
                
                HStack{
                    PayandCustomerSupportView(buttonImage: "other_card", buttonText: "스토어 케어")
                    
                    Spacer().frame(width: 104)
                    
                    PayandCustomerSupportView(buttonImage: "other_card_change", buttonText: "고객의 소리")
                }
                
                Spacer().frame(height: 32)
                
                HStack{
                    PayandCustomerSupportView(buttonImage: "other_card", buttonText: "매장 정보")
                    
                    Spacer().frame(width: 104)
                    
                    PayandCustomerSupportView(buttonImage: "other_card_change", buttonText: "반납기 정보")
                }
                
                Spacer().frame(height: 32)
                
                HStack{
                    PayandCustomerSupportView(buttonImage: "other_card", buttonText: "마이 스타벅스 리뷰")
                    
                    Spacer().frame(width: 263)
                }
                
                Spacer().frame(height: 57)
            }
        }
        .padding(.horizontal, 10)
        .background(Color.white01.ignoresSafeArea())
    }
}

struct OtherButtonView: View {
    let buttonImage: String
    let buttonText: String

    var body: some View {
        Group {
            if buttonText == "전자영수증" {
                Button {
                    print("Navigation 이동 필요")
                } label: {
                    buttonContent
                }

            } else {
                Button(action: {
                    print("\(buttonText)")
                }) {
                    buttonContent
                }
            }
        }
        .frame(width: 102, height: 108)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.vertical, 17)
    }

    private var buttonContent: some View {
        VStack(spacing: 4) {
            Image(buttonImage)
                .resizable()
                .frame(width: 48, height: 48)

            Text(buttonText)
                .font(.mainTextSemiBold16)
                .foregroundColor(.black)
        }
    }
}

struct PayandCustomerSupportView: View {
    let buttonImage: String
    let buttonText: String
    
    var body: some View {
        
        
        Button(action: {
            print("\(buttonText)")
        }) {
            HStack {
                Image("\(buttonImage)")
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Spacer().frame(width: 4)
                
                Text("\(buttonText)")
                    .font(.mainTextSemiBold16)
                    .foregroundColor(.black)
                
                Spacer() // 왼쪽 정렬용
            }
        }
        .frame(width: 157)
    }
}


#Preview{
    OtherView()
}
