import SwiftUI

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.mainTextSemiBold14)
                
                Text(product.ml)
                    .font(.mainTextSemiBold14)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(width: 140)
    }
}


