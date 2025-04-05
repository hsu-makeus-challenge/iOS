import SwiftUI

struct WhatsNewView: View {
    var hVM = HomeViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("What’s New")
                .font(.mainTextBold24)
                .padding(.leading, 10)

            ScrollView(.horizontal) {
                LazyHStack() {
                    ForEach(hVM.whatsNewItems) { item in
                        WhatsNewCard(item: item)
                    }
                }
            
            }
            .padding(.trailing, 4)
        }
    }
}

#Preview {
    WhatsNewView()
}
