import SwiftUI

struct CoffeeDetailView: View {
    let coffeeName: String
    @Environment(\.dismiss) var dismiss
    @State private var selectedTemperature: TemperatureType = .iced

    private let viewModel = CoffeeDetailViewModel()

    enum TemperatureType: String, CaseIterable {
        case hot = "HOT"
        case iced = "ICED"
    }

    var body: some View {
        if let coffee = viewModel.detail(for: coffeeName) {
            VStack {
                ZStack(alignment: .top) {
                    VStack {
                        Image(coffee.imageName)
                            .resizable()
                            .frame(height: 355)
                            .ignoresSafeArea()

                        Spacer().frame(height: 20)

                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(coffee.nameKr)
                                        .font(.mainTextSemiBold24)
                                        .foregroundColor(.black03)
                                    Spacer().frame(width: 4)
                                    Image("new") // 조건부 표시도 가능
                                }

                                Spacer().frame(height: 4)

                                Text(coffee.nameEn)
                                    .font(.mainTextSemiBold14)
                                    .foregroundColor(.gray01)
                            }

                            Spacer().frame(height: 32)

                            Text(coffee.description)
                                .font(.mainTextSemiBold14)
                                .foregroundColor(.gray06)
                                .fixedSize(horizontal: false, vertical: true)

                            Spacer().frame(height: 20)

                            Text(coffee.price)
                                .font(.mainTextSemiBold24)
                                .foregroundColor(.black03)

                            Spacer().frame(height: 32)

                            Picker("온도 선택", selection: $selectedTemperature) {
                                ForEach(TemperatureType.allCases, id: \.self) { temp in
                                    Text(temp.rawValue)
                                        .tag(temp)
                                }
                            }
                            .pickerStyle(.segmented)

                            Spacer().frame(height: 253)

                            Button(action: {}) {
                                Text("주문하기")
                                    .font(.mainTextMedium16)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 46)
                                    .foregroundColor(.white01)
                                    .background(Color.green01)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            }

                            Spacer().frame(height: 29)
                        }
                        .padding(.horizontal, 10)
                    }

                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image("icon_chevornleft")
                        }

                        Spacer().frame(width: 360)

                        Button {
                            dismiss()
                        } label: {
                            Image("icon_share")
                        }
                    }
                    .padding(.horizontal, 8)
                }
            }
            .navigationBarBackButtonHidden(true)
                    .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    CoffeeDetailView(coffeeName: "아이스 카라멜 마키아또")
}
