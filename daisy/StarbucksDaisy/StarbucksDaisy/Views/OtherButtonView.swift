//
//  OtherButtonView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct OtherButtonView: View {
    let buttonImage: String
    let buttonText: String
    
    init(buttonImage: String, buttonText: String) {
        self.buttonImage = buttonImage
        self.buttonText = buttonText
    }
    
    var body: some View {
        Button(action: {
            print("\(buttonText)")
        }, label: {
            VStack(spacing: 15) {
                Image("\(buttonImage)")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("\(buttonText)")
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(.black03)
            }
            .frame(width: 102, height: 108)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        })
    
    }
}

#Preview {
    OtherView()
}
