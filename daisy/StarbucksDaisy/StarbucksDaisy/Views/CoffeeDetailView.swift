//
//  CoffeeDetailView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/3/25.
//

import SwiftUI

struct CoffeeDetailView: View {
//    let name: String
//    let englishName: String
//    let image: String
//    let content: String
//    let price: Double
    let coffee: Coffee
    @State private var selectedTempType = 0
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Image(coffee.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 440, height: 355)
                .clipped()
            
            Spacer().frame(height: 20)
            
            /// 내부 커피 정보 컨텐츠
            VStack(alignment: .leading) {
                /// 상품 name, english name
                VStack(alignment: .leading, spacing: 4) {
                    
                    HStack (spacing: 4) {
                        Text(coffee.name)
                            .font(.mainTextSemiBold24)
                            .foregroundStyle(.black03)
                        Image("new")
                    }
        
                    Text(coffee.englishName)
                        .font(.mainTextSemiBold14)
                        .foregroundStyle(.gray01)
                }
                .frame(alignment: .leading)
                
                Spacer()
                                
                /// content, price, tempType
                VStack(alignment: .leading, spacing: 20) {
                    Text(coffee.content)
                        .font(.mainTextSemiBold14)
                        .foregroundStyle(.gray06)
                    
                    Text("\(coffee.price)원")
                        .font(.mainTextBold24)
                        .foregroundStyle(.black03)
                }
                .frame(alignment: .leading)
                
                Spacer()
                
                Picker("tempType", selection: $selectedTempType) {
                    Text("Hot")
                    Text("Iced")
                }.pickerStyle(.segmented)
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: 256, alignment: .leading)
            
            Spacer()
            
            Button(action: {
                print("주문하기")
            }, label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 58)
                    .foregroundStyle(.green01)
                    .overlay(content: {
                        Text("주문하기")
                            .font(.mainTextMedium16)
                            .foregroundStyle(.white01)
                    })
            })
            .padding(.horizontal, 28)
            .padding(.vertical, 15)
        }
        .padding(.bottom, 14)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)        // 기본 백버튼 숨김
        .toolbar {                                  // ToolbarItem으로 백버튼 커스텀(?)
            ToolbarItem(placement: .topBarLeading,
                        content: {
                Button(action: {
                    dismiss()
                }, label: {
                    Image("back")
                })
            })
            
            ToolbarItem(placement: .topBarTrailing,
                        content: {
                Button(action: {
                }, label: {
                    Image("share")
                })
            })
        }
    }
    
}

#Preview {
//    CoffeeDetailView()
    TabbarView()
}
