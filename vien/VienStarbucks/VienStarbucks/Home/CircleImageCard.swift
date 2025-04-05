import SwiftUI

struct CircleImageCard: View {
    let imageName: String
    let name: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
                .clipShape(Circle())
            
            Spacer().frame(height:10)
            
            Text(name)
                .font(.caption)
                .foregroundColor(.black)
        }
    }
}
