//
//  MovieVIew.swift
//  2Week
//
//  Created by 송승윤 on 3/24/25.
//

import SwiftUI
import Observation

struct MovieView: View {
    // MovieView 완성
    @AppStorage("movieName") private var movieName: String = ""
    private var viewModel: MovieViewModel = .init()
    
    var body: some View {
        VStack(spacing: 56) {
            MovieCard(movieInfo: viewModel.movieModel[viewModel.currentIndex])
            
            leftRightChange
            
            settingMovie
            
            printAppStorageValue
        }
        .padding()
    }
    
    /// 왼쪽 오른쪽 change 버튼
    private var leftRightChange: some View {
        HStack {
            Group {
                makeChevron(name: "chevron.left", action: viewModel.previousMovie)
                
                Spacer()
                
                Text("영화 바꾸기")
                    .font(.system(size: 20, weight: .regular))
                
                Spacer()
                
                makeChevron(name: "chevron.right", action: viewModel.nextMovie)
            } //: Group
            .foregroundStyle(Color.black)
        } //: HStack
        .frame(width: 256)
        .padding(.vertical, 17) // 수직으로 패딩을 준다
        .padding(.horizontal, 22) // 수평으로 패딩을 준다
    }
    
    /// 화살표 재사용하기 위한 하위 뷰
    ///  - Parameteres:
    ///  - name: 이미지 이름 설정
    ///  - action: 버튼 액션 기능, @escaping 클로저: 비동기 처리
    ///  - Returns: some View 타입 변환
    private func makeChevron(name: String, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: name)
                .resizable()
                .frame(width: 17.47, height: 29.73)
        })
    }
    
    /// 대표 영화 설정
    private var settingMovie: some View {
        Button(action: {
            /* 현재 인덱스의 영화 이름 AppStorage에 저장 */
            self.movieName = viewModel.movieModel[viewModel.currentIndex].movieName
        }, label: {
            Text("대표 영화로 설정")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(Color.black)
                .padding(.top, 21)
                .padding(.bottom, 20)
                .padding(.leading, 53)
                .padding(.trailing, 52)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.clear)
                        .stroke(Color.black, style: .init(lineWidth: 1))
                })
        })
    }
    
    /// 하단 AppStrorage에 저장된 영화 확인 텍스트
    private var printAppStorageValue: some View {
        VStack (spacing: 17) {
            Text("@AppStorage에 저장된 영화")
                .font(.system(size:30, weight: .regular))
                .foregroundStyle(Color.black)
            
            Text("현재 저장된 영화 : \(movieName)")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(Color.red)
        }
    }
}

#Preview {
    MovieView()
}
