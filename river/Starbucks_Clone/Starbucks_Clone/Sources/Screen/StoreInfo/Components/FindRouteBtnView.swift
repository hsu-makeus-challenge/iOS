//
//  FindRouteBtnView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/27/25.
//

import SwiftUI

struct FindLocationBtnView: View {
    var body: some View {
        Button {
            print("경로 찾기")
        } label: {
            Text("경로 찾기")
                .font(.mainTextMedium16)
                .foregroundStyle(Color.white)
        }
        .frame(width: 375, height: 38)
        .background(Color(.green00))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    FindLocationBtnView()
}
