import SwiftUI

struct MainTabView: View {
    //이미지 안됨
    var body: some View {
        TabView {
            Tab("Other", systemImage: "ellipsis") {
                OtherView()
            }
            
            Tab("Home", systemImage: "house") {
                HomeView()
            }

            Tab("Pay", systemImage: "creditcard") {
                PayView()
            }

            Tab("Order", systemImage: "cup.and.saucer") {
                OrderView()
            }

            Tab("Shop", systemImage: "bag") {
                ShopView()
            }
        }
        .tint(.green02)
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home")
    }
}

struct PayView: View {
    var body: some View {
        Text("Pay")
    }
}

struct OrderView: View {
    var body: some View {
        Text("Order")
    }
}

struct ShopView: View {
    var body: some View {
        Text("Shop")
    }
}




//아니 버튼 코드가 너무 겹치는데??
// 뭔가 공통 코드로 뺄수 있을듯
// + 1주차 2번쨰로 loginView만들었던 것처럼 얘네도 각각 struct 로 빼야할듯
struct OtherView: View {
    @StateObject private var otherViewModel = OtherViewModel()
    
    
    var body: some View {
        
        
            //상단바?
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
//            .padding(.top, 68)
            .padding(.bottom, 16)
            
        VStack(){
            Spacer().frame(height: 41)
            //환영 메시지
            VStack(spacing: 4) {
                HStack() {
                    Text(otherViewModel.nickname)
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
            
            
            // 상단 버튼
                HStack() {
                    Button(action: {
                        print("별 히스토리")
                    }) {
                        VStack(spacing: 7) { // ← 위아래 간격 조절
                            Image("othertabStar")
                                .resizable()
                                .frame(width: 38, height: 38)
                            
                            Text("별 히스토리")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                        .padding(.vertical, 17)
                        .padding(.horizontal, 22)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                            
                            
                    Button(action: {
                        print("별 히스토리")
                    }) {
                        VStack(spacing: 7) { // ← 위아래 간격 조절
                            Image("othertabStar")
                                .resizable()
                                .frame(width: 38, height: 38)
                        
                            Text("별 히스토리")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                        .padding(.vertical, 17)
                        .padding(.horizontal, 22)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                            
                            
                    Button(action: {
                        print("별 히스토리")
                    }) {
                        VStack(spacing: 7) { // ← 위아래 간격 조절
                            Image("othertabStar")
                                .resizable()
                                .frame(width: 38, height: 38)
                        
                            Text("별 히스토리")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                        .padding(.vertical, 17)
                        .padding(.horizontal, 22)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                                   
            }.padding(.horizontal, 60)

            Spacer().frame(height: 41)
            
            
            // ㄹㅇ 버튼 많은 구역
            VStack {
                
                //Pay 구역
                Text("Pay")
                    .font(.mainTextSemiBold18)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer().frame(height: 24)
                    
      
                //카드 관련 버튼
                HStack {
                    Button(action: {
                        print("스타벅스 카드 등록")
                    }) {
                        HStack {
                            Image("card")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Spacer().frame(width: 4)
                            
                            Text("스타벅스 카드 등록")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                    }

                    Spacer().frame(width: 104)
                    
                    
                    Button(action: {
                        print("스타벅스 카드 등록")
                    }) {
                        HStack {
                            Image("card")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Spacer().frame(width: 4)
                            
                            Text("스타벅스 카드 등록")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Spacer().frame(height: 32)
                
                //쿠폰 관련 버튼
                HStack {
                    Button(action: {
                        print("스타벅스 카드 등록")
                    }) {
                        HStack {
                            Image("card")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Spacer().frame(width: 4)
                            
                            Text("스타벅스 카드 등록")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                    }

                    Spacer().frame(width: 104)
                    
                    
                    Button(action: {
                        print("스타벅스 카드 등록")
                    }) {
                        HStack {
                            Image("card")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Spacer().frame(width: 4)
                            
                            Text("스타벅스 카드 등록")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Spacer().frame(height: 16)
                
                Divider()
                    .background(Color("gray00"))
                
                Spacer().frame(height: 41)
                
                
                //고객지원 구역
                Text("고객지원")
                    .font(.mainTextSemiBold18)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Spacer().frame(height: 24)
                
                // 스토어 & 고객의 소리
                HStack {
                    Button(action: {
                        print("스타벅스 카드 등록")
                    }) {
                        HStack {
                            Image("card")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Spacer().frame(width: 4)
                            
                            Text("스타벅스 카드 등록")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                    }

                    Spacer().frame(width: 104)
                    
                    
                    Button(action: {
                        print("스타벅스 카드 등록")
                    }) {
                        HStack {
                            Image("card")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Spacer().frame(width: 4)
                            
                            Text("스타벅스 카드 등록")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Spacer().frame(height: 32)
                
                //매장 정보 & 반납기 정보
                HStack {
                    Button(action: {
                        print("스타벅스 카드 등록")
                    }) {
                        HStack {
                            Image("card")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Spacer().frame(width: 4)
                            
                            Text("스타벅스 카드 등록")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                    }

                    Spacer().frame(width: 104)
                    
                    
                    Button(action: {
                        print("스타벅스 카드 등록")
                    }) {
                        HStack {
                            Image("card")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Spacer().frame(width: 4)
                            
                            Text("스타벅스 카드 등록")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                
                
                Spacer().frame(height:32)
                
                
                
                
                HStack {
                    Button(action: {
                        print("스타벅스 카드 등록")
                    }) {
                        HStack {
                            Image("card")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Spacer().frame(width: 4)
                            
                            Text("스타벅스 카드 등록")
                                .font(.mainTextSemiBold16)
                                .foregroundColor(.black)
                        }
                    }

                    Spacer().frame(width: 263)
                    
                }
                
                Spacer().frame(height:57)
                
                
            }.padding(.horizontal, 10)
                
  
        }
        .background(
            Color.white01
                .ignoresSafeArea()
        )
    }
}

#Preview {
    MainTabView()
}
