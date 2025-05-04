// 꼭 세로로 쌓을 필요 없으면 그룹으로 묶는게 좋음

import SwiftUI

struct OrderView: View {
    @StateObject private var viewModel = OrderViewModel()
    @State private var showStoreSheet = false
    @Namespace private var underline

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Order")
                    .font(.mainTextBold24)
                    .padding(.leading, 23)

                ZStack(alignment: .bottom) {
                    VStack(spacing: 0) {
                        // ✅ 버튼 영역은 padding 30 유지
                        HStack(spacing: 0) {
                            ForEach(MenuTab.allCases, id: \.self) { tab in
                                Button {
                                    withAnimation(.easeInOut) {
                                        viewModel.selectedMenuTab = tab
                                    }
                                } label: {
                                    HStack(spacing: 4) {
                                        if tab == .cake {
                                            Image(systemName: "birthday.cake")
                                                .font(.system(size: 14))
                                                .foregroundColor(.green01)
                                        }
                                        Text(tab.rawValue)
                                            .font(.mainTextSemiBold16)
                                            .foregroundColor(color(for: tab))
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 13)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .background(Color.white)
                        .shadow(color: Color.gray.opacity(0.1), radius: 2, y: 4)

                        // ✅ underline은 전체 너비에 출력되도록 padding 제거
                        HStack(spacing: 0) {
                            ForEach(MenuTab.allCases, id: \.self) { tab in
                                if viewModel.selectedMenuTab == tab {
                                    Rectangle()
                                        .fill(Color.green01)
                                        .matchedGeometryEffect(id: "underline", in: underline)
                                        .frame(height: 3)
                                } else {
                                    Color.clear.frame(height: 3)
                                }
                            }
                        }
                        // padding 제거!
                    }
                }
                
                Spacer().frame(height: 10)
                
                // 나중에 버튼으로 바꾸기
                // New도 추가하기
                HStack(spacing:24) {
                    Text("음료")
                        .font(.mainTextSemiBold16)
                        .foregroundColor(.black01)
                    Text("푸드")
                        .font(.mainTextSemiBold16)
                        .foregroundColor(.gray04)
                    Text("상품")
                        .font(.mainTextSemiBold16)
                        .foregroundColor(.gray04)
                    Spacer()
                }
                .padding(.horizontal, 30)
            }

            Spacer().frame(height: 12)
            
            Divider()
            
            Spacer().frame(height: 19)

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.menuItems) { item in
                        MenuItemRow(item: item)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 80)
            }

            VStack(spacing: 0) {
                HStack {
                    Text("주문할 매장을 선택해 주세요")
                        .foregroundColor(.white)

                    Spacer()

                    Button(action: {
                        showStoreSheet.toggle()
                    }) {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                    }
                }
                .padding()

                Rectangle()
                    .fill(Color.white.opacity(0.3))
                    .frame(height: 1)
                    .padding(.horizontal, 16)
            }
            .background(Color.black)
            .sheet(isPresented: $showStoreSheet) {
                StoreSelectionView()
            }
        }
    }

    private func color(for tab: MenuTab) -> Color {
        switch tab {
        case .cake:
            return .green01
        case .total, .personal:
            return viewModel.selectedMenuTab == tab ? .black01 : .gray04
        }
    }
}

struct MenuItemRow: View {
    let item: MenuItem

    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(item.name)
                        .font(.headline)
                    Circle()
                        .foregroundColor(.green01)
                        .frame(width: 6, height: 6)
                }
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
    }
}

#Preview {
    OrderView()
}
