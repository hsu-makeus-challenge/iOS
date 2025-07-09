//  CustomPagingSlider.swift
//  CustomSlider
//
//  Created by 이은정 on 5/31/25.
//

import SwiftUI

//Paging Slider Data Model
struct Item: Identifiable {
    private(set) var id: UUID = .init()
    var color: Color
    var title: String
    var subtitle: String
}


//Content View
struct CustomPagingSlider<Content: View, TitleContent: View, Item:RandomAccessCollection>: View where Item: MutableCollection, Item.Element: Identifiable {
    // Customization Properties
    var showsIndicators: ScrollIndicatorVisibility = .hidden
    var showPagingControl: Bool = true
    var titleScrollSpeed : CGFloat = 0.6
    var pagingControlSpacing: CGFloat = 20
    var spacing: CGFloat = 10
    
    @Binding var data: Item
    @ViewBuilder var content: (Binding<Item.Element>) -> Content
    @ViewBuilder var titleContent: (Binding<Item.Element>) -> TitleContent
    var body: some View {
        
        VStack(spacing: pagingControlSpacing){
            ScrollView(.horizontal){
                HStack(spacing: spacing) {
                    ForEach($data) { item in
                        VStack(spacing: 0) {
                            titleContent(item)
//                                .frame(maxWidth: .infinity)
//                                .visualEffect { content, geometryProxy in content
//                                        .offset(x: scrollOffset(geometryProxy))
//                                }
                            
                            content(item)
                        }
                        .containerRelativeFrame(.horizontal)
                    }
                }
                
            }
            ///Adding Paging
            .scrollTargetLayout()
        }
        .scrollIndicators(showsIndicators)
        .scrollTargetBehavior(.viewAligned)
    }
    
    
//    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
//        let minX = proxy.bounds(of: .scrollView)?.minX ?? 0
//        
//        return -minX * min(titleScrollSpeed, 1.0)
//    }
}


#Preview {
    ContentView()
}
