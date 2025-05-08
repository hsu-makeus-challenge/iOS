//
//  CircleImageCard.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/3/25.
//

import Foundation
import SwiftUI

struct CircleImageCard: View {
    let name: String
    let image: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(image)
                .resizable()
                .frame(width: 130, height: 130)
                .clipShape(Circle())
            Text(name)
                .font(.mainTextSemiBold14)
                .foregroundStyle(.black02)
        }
    }
}
