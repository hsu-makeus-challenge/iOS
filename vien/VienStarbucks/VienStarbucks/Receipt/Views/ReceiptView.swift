//
//  ReceiptView.swift
//  VienStarbucks
//
//  Created by 이은정 on 4/10/25.
//
import SwiftUI

struct ReceiptView: View {
    @ObservedObject var viewModel = ReceiptViewModel()
    @State private var showDialog = false  // ✅ 다이얼로그 표시 여부

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                // 내비게이션 바
                HStack {
                    Button(action: {
                        // 뒤로가기
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.mainTextMedium16)
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    Text("전자영수증")
                        .font(.headline)
                    Spacer()
                    
                    Button(action: {
                        showDialog = true
                    }) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundStyle(.black)
                    }
                    .confirmationDialog("영수증을 어떻게 가져오시겠어요?", isPresented: $showDialog, titleVisibility: .visible) {
                        Button("앨범에서 가져오기") {
                            // 앨범 액션
                        }
                        Button("카메라로 촬영하기") {
                            // 카메라 액션
                        }
                        Button("취소", role: .cancel) {
                            // 취소
                        }
                    }
                }
                .padding(.bottom, 22)
                .padding(.horizontal, 14)
                
                
                VStack{
                    // 총 건수 / 합계
                    HStack {
                        (
                            Text("총 ")
                                .foregroundColor(.black) +
                            Text("\(viewModel.receipts.count)건")
                                .foregroundColor(Color.brown02)
                        )
                        
                        Spacer()
                        
                        (
                            Text("사용합계 ")
                                .foregroundColor(.black) +
                            Text("\(viewModel.totalAmount)")
                                .foregroundColor(Color.brown02)
                        )
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                    
                    // 영수증
                    ScrollView {
                        ForEach(viewModel.receipts) { receipt in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(receipt.place)
                                    .fontWeight(.bold)
                                Text(receipt.date)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                HStack {
                                    Text("\(receipt.amount)원")
                                        .foregroundColor(Color.brown02)
                                    Spacer()
                                    Image("receipt_dollar")
                                        .foregroundColor(.green)
                                }
                            }
                            
                            Divider()
                        }
                    }
                }
                .padding(.horizontal, 19)
                
            }
            .background(Color.white01)
        }
    }
}



#Preview {
    ReceiptView()
}
