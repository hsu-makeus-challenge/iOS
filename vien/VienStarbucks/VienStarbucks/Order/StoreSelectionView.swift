import SwiftUI
import MapKit

struct StoreSelectionView: View {
    @StateObject private var viewModel = StoreViewModel()
    @State private var selectedTab: Int = 0
    @State private var showMap = false
    @State private var searchText: String = ""
    
    @State private var selectedCoordinate: CLLocationCoordinate2D? = nil
    @State private var cameraCenter: CLLocationCoordinate2D? = nil

    var body: some View {
        VStack(spacing: 0) {
            // 상단 타이틀 + 지도 버튼
            HStack {
                Spacer().frame(width:130)
                Text("매장 설정")
                    .font(.mainTextBold20)
                    .bold()
                Spacer()
                Button(action: {
                    showMap.toggle()
                }) {
                    Image(systemName: showMap ? "list.bullet" : "map")
                        .font(.title3)
                        .padding(.trailing)
                        .foregroundColor(Color.gray04)
                }
            }
            .padding(.bottom, 24)

            // 검색창
            TextField("검색", text: $searchText)
                .padding(6)
                .background(Color.gray07)
                .cornerRadius(5)

            Spacer().frame(height: 22)
            
            // 탭
            HStack {
                Button(action: { selectedTab = 0 }) {
                    Text("가까운 매장")
                        .font(.mainTextSemiBold14)
                        .fontWeight(selectedTab == 0 ? .bold : .regular)
                        .foregroundColor(selectedTab == 0 ? .black : .gray)
                }
                Text("|")
                    .foregroundColor(Color.gray03)
                Button(action: {}) {
                    Text("자주 가는 매장")
                        .font(.mainTextSemiBold14)
                        .foregroundColor(Color.gray03)
                }
                Spacer()
            }
            
            Spacer().frame(height: 17)
            Divider()
            
            if showMap {
                HybridMapView(
                    selectedCoordinate: $selectedCoordinate,
                    cameraCenter: $cameraCenter
                )
                .edgesIgnoringSafeArea(.all)
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(viewModel.stores) { store in
                            StoreCard(store: store)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
        .padding(.horizontal, 30)
    }
}
#Preview {
    StoreSelectionView()
}
