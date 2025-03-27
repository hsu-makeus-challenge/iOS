//
//  OtherLabelView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct OtherLabelView: View {
    let image: String
    let text: String
    
    init(image: String, text: String) {
        self.image = image
        self.text = text
    }
    
    var body: some View {
        HStack(spacing: 4) {
            Image(image)
                .resizable()
                .frame(width: 32, height: 32)
            Text(text)
                .font(.mainTextSemiBold16)
                .foregroundStyle(.black02)
            Spacer()
        }
        .frame(width: 170)
    }
}
