//
//  NewsCard.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/3/25.
//

import SwiftUI

struct NewsCard: View {
    let title: String
    let content: String
    let thumbnail: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(thumbnail)
                .resizable()
                .frame(width: 242, height: 160)
            
            Spacer().frame(height: 16)
            
            Text(title)
                .font(.mainTextSemiBold18)
                .foregroundStyle(.black02)
            
            Spacer().frame(height: 9)
            
            Text(content)
                .font(.mainTextSemiBold13)
                .foregroundStyle(.gray03)
        }
        .frame(width: 242)
    }
}
