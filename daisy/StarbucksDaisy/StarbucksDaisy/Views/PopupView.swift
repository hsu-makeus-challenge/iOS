//
//  PopupView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct PopepView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Image("popupImage")
                .frame(height: 720)
            Spacer()
            BottomButton
        }
        .frame(width: 438, height: 920)
        .padding(.bottom, 36)
    }
    
    private var BottomButton: some View {
        VStack(alignment: .trailing, spacing: 19) {
            Button(action: {
                print("자세히 보기")
            }, label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 402, height: 58)
                    .foregroundStyle(.green01)
                    .overlay(content: {
                        Text("자세히 보기")
                            .font(.makeMedium18)
                            .foregroundStyle(.white01)
                    })
            })
            
            
            Button(action: {
                dismiss()
            }, label: {
                Text("X 닫기")
                    .font(.mainTextLight14)
                    .foregroundStyle(.gray05)
            })
        }
        .frame(width: 402, height: 94)
    }
}

#Preview {
    PopepView()
}
