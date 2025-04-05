import SwiftUI

struct WhatsNewCard: View {
    let item: WhatsNewItemModel

    var body: some View {
        VStack(alignment: .leading) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 242, height: 160)
                .cornerRadius(5)

            
            VStack{
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.black02)
                    .lineLimit(1)
                    .frame(width: 200)
                
                Text(item.subtitle)
                    .font(.caption)
                    .foregroundColor(.gray03)
                    .lineLimit(2)
                    .frame(width: 200)
            }
        }
        .padding(.leading, 10)
    }
}
