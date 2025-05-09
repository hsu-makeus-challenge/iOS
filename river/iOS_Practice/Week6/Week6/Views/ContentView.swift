//
//  ContentView.swift
//  Weak6
//
//  Created by jaewon Lee on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var showCameraView: Bool = false
    var body: some View {
        Button(action: {
            showCameraView.toggle()
        }, label: {
            Text("책 조회하기")
                .font(.title)
                .foregroundStyle(Color.black)
        })
        .fullScreenCover(
            isPresented: $showCameraView,
            content: {
            ISBNScannerView()
        })
    }
}

#Preview {
    ContentView()
}
