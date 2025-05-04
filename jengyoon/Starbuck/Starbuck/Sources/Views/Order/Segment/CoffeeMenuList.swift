//
//  CoffeeMenuList.swift
//  Starbuck
//
//  Created by 송승윤 on 5/4/25.
//

import SwiftUI

struct CoffeeMenuList: View {
    let menuItems: [OrderCoffeeModel]
    
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 26) {
                ForEach(menuItems) { item in
                    CoffeeMenuRow(item: item)
                }
            }
        }
    }
}

struct CoffeeMenuRow: View {
    let item: OrderCoffeeModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(item.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack (alignment: .leading) {
                Text(item.name)
                    .font(.PretendardSemiBold16)
                    .foregroundStyle(Color.black)
                Text(item.description)
                    .font(.PretendardSemiBold14)
                    .foregroundStyle(Color.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white)
    }
}
