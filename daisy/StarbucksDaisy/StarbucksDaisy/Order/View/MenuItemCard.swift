//
//  MenuItemCard.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 5/3/25.
//

import SwiftUI

struct MenuItemCard: View {
    let menu: BeverageMenu
    
    var body: some View {
        HStack(spacing: 16) {
            Image(menu.imageName)
                .resizable()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading, spacing: 4) {
                HStack (spacing: 2) {
                    Text(menu.title)
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(.gray06)
                    if menu.showDot {
                        Image("BeverageMenu/dot")
                        .padding(.bottom)
                    }
                }
                Text(menu.englishTitle)
                    .font(.mainTextSemiBold13)
                    .foregroundStyle(.gray03)
            }
            
            Spacer()
        }
    }
}
#Preview {
    MenuItemCard(menu: BeverageMenu(title: "추천", englishTitle: "Recommend", imageName: "BeverageMenu/img-0", showDot: true))
}
