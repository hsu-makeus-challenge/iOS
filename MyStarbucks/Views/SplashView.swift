import SwiftUI


struct SplashView: View {
    var body: some View {
        ZStack (alignment: .center){
            Color("green01")
                .ignoresSafeArea() //전체화면채우기
            
            Image(.starbucksLogo)
                .resizable()
                .frame(width: 168, height: 168)
            
        }
        
    }
}

#Preview {
    SplashView()
}
