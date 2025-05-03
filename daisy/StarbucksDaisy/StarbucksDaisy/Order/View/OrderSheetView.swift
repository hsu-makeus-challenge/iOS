//
//  OrderSheetView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 5/4/25.
//

import SwiftUI

struct OrderSheetView: View {
    
    @State var viewModel = OrderViewModel()
    
    var body: some View {
        VStack {
            topNavigationBar
            
            Spacer()
            
            ScrollView {
                scrollTopView
                
                Spacer().frame(height: 28)
            }
            .padding(.horizontal, 32.5)
        }
    }
    
    private var topNavigationBar: some View {
        HStack(alignment: .center) {
            
            Spacer().frame(width: 158)
            
            Text("매장 설정")
                .font(.mainTextMedium16)
            
            Spacer().frame(width: 142)
            
            Button(action: {
                
            }, label: {
                Image(systemName: "map")
                    .foregroundStyle(.gray04)
            })
        }
        .padding(.vertical, 24)
    }
    
    private var scrollTopView: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray08)
                .frame(height: 27)
                .overlay(alignment: .leading, content: {
                    Text("검색")
                        .font(.mainTextSemiBold12)
                        .foregroundStyle(.gray00)
                        .padding(.horizontal, 7)
                })
            
            Spacer().frame(height: 22)
            
            HStack {
                ForEach(PlaceSegment.allCases, id: \.id) { segment in
                    PlaceSegmentView(segment: segment)
                    Image("verticalvector")
                }
            }
            
            Spacer().frame(height: 17)
            
            Divider()
                .background(Color.gray07)
                .frame(height: 1)
        }
    }
    
    @ViewBuilder
    func PlaceSegmentView(segment: PlaceSegment) -> some View {
        HStack {
            Text(segment.title)
                .font(.mainTextSemiBold13)
                .foregroundStyle(viewModel.selectedPlaceSegment == segment ? .black03 : .gray03)
                .onTapGesture {
                    viewModel.selectedPlaceSegment = segment
                }
        }
    }
}

#Preview {
    OrderSheetView()
}
