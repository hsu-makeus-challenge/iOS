//
//  TicketView.swift
//  1st_Practice
//
//  Created by jaewon Lee on 3/18/25.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, World!")
        }
        .padding()
        .onAppear {
            UIFont.familyNames.sorted().forEach { familyName in
                print("*** \(familyName) ***")
                UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                    print("\(fontName)")
                }
                print("-------------------------")
            }
        }
    }
}

#Preview {
    TicketView()
}
