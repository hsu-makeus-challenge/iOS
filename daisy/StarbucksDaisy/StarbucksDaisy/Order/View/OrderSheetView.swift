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
        VStack(spacing: 0) {
            topNavigationBar
            
            Spacer()
            
            scrollTopView
                .padding(.horizontal, 32.5)
            
            ScrollView {
                
                storeListView
                    .padding(.top, 28)
            }
            .padding(.horizontal, 32.5)
            .scrollIndicators(.hidden)
        }
        .task {
            // OrderSheetView가 처음 나타날 때 위치 측정 시작
            viewModel.requestUserLocationOnce()
        }
    }
    
    private var topNavigationBar: some View {
        HStack(alignment: .center) {
            
            Spacer().frame(width: 18)
            Spacer()
            
            Text("매장 설정")
                .font(.mainTextMedium16)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "map")
                    .foregroundStyle(.gray04)
            })
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 32.5)
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
    
    private var storeListView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                ForEach(viewModel.stores) { store in
                    HStack(spacing: 16) {
                        Image("storeImg0")
                        
                        VStack(alignment: .leading) {
                            Text(store.properties.storeName)
                                .font(.mainTextSemiBold13)
                                .foregroundStyle(.black03)
                            
                            Spacer().frame(height: 3)
                            
                            Text(store.properties.address)
                                .font(.mainTextMedium10)
                                .foregroundStyle(.gray02)
                            
                            Spacer().frame(height: 15)
                            
                            HStack(spacing: 4) {
                                if store.properties.category == "리저브 매장" {
                                    Image("reserveStore")
                                }
                                
                                if store.properties.category == "DT 매장" {
                                    Image("dtStore")
                                }
                                
                                Spacer()
                                
                                Text(viewModel.distanceFromUser(to: store))
                                    .font(.mainTextMedium12)
                                    .foregroundStyle(.black01)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    OrderSheetView()
}
