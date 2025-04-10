//
//  PopupView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct PopupView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            ScrollView {
                Image("popupImage")
                                .resizable().scaledToFit()

                Spacer()
                BottomButton
            }
        }
        .padding(.bottom, 36)
        .ignoresSafeArea(edges: .top)
    }
    
    private var BottomButton: some View {
        VStack(alignment: .trailing, spacing: 19) {
            Button(action: {
                print("자세히 보기")
                dismiss()
            }, label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.green01)
                    .overlay(content: {
                        Text("자세히 보기")
                            .font(.makeMedium18)
                            .foregroundStyle(.white01)
                            .padding(.vertical, 19)
                    })
            })

            Button(action: {
                dismiss()
            }, label: {
                Text("X 닫기")
                    .font(.mainTextLight14)
                    .foregroundStyle(.gray05)
            })
            .padding(.trailing, 19)
        }
        .padding(.horizontal, 18)
        .frame(height: 94)
    }
}

#Preview {
    PopupView()
}
