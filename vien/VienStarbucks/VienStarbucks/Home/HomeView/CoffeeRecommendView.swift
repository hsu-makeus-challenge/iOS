import SwiftUI

struct CoffeeRecommendView: View {
    var hVM = HomeViewModel()
    var onCoffeeSelected: (String) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text("추천 메뉴")
                .font(.mainTextBold24)
                .foregroundColor(.black)

            Spacer().frame(height:25)

            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(hVM.recommendCoffee) { coffee in

                        Button {
                            print("선택된 커피 이름: \(coffee.name)")
                            onCoffeeSelected(coffee.name) // 아니 이건 잘 나오고 맞는데 어디가 틀린겨 어디서 못찾는겨
                        } label: {
                            CircleImageCard(imageName: coffee.imageName, name: coffee.name)
                        }
                    }
                }
                .padding(.trailing, 16)
            }
        }
        .padding(.leading, 20)
    }
}

#Preview {
    CoffeeRecommendView(onCoffeeSelected: { coffeeName in
        print("Preview에서 선택된 커피: \(coffeeName)")
    })
}
