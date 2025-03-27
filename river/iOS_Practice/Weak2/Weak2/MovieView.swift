//
//  MovieView.swift
//  Weak2
//
//  Created by jaewon Lee on 3/25/25.
//

import SwiftUI

struct MovieView: View {
    
    @AppStorage("movieName") private var movieName: String = ""
    private var viewModel: MovieViewModel = .init()
    
    var body: some View {
        VStack(spacing: 56) {
            MovieCard(
                movieInfo: viewModel.movieModel[
                    viewModel.currentIndex
                ]
            )
            
            leftRightChange
            
            settingMovie
            
            printAppStorageValue
            
        }
    }
    
    private var leftRightChange: some View {
        HStack {
            Group {
                makeChevron(
                    name: "chevron.left",
                    action: viewModel.previousMovie
                )
                
                Spacer()
                
                Text("영화 바꾸기")
                    .font(.system(size: 20, weight: .regular))
                
                Spacer()
                
                makeChevron(
                    name: "chevron.right",
                    action: viewModel.nextMovie
                )
            }
            .foregroundStyle(.black)
        }
        .frame(width: 256)
        .padding(.vertical, 17)
        .padding(.horizontal, 22)
    }
    
    /// 화살표 재사용하기 위한 하위 뷰
    /// - Parameters:
    ///   - name: 이미지 이름 설정
    ///   - action: 버튼이 가지는 액션 기능 넣기, @escpaing은 추후 문법을 통해 배우게 될 겁니다!
    /// - Returns: some View 타입 반환
    private func makeChevron(
        name: String,
        action: @escaping () -> Void
    ) -> some View {
        Button {
            action()
        } label: {
            Image(systemName: name)
                .resizable()
                .frame(width: 17.47, height: 29.73)
        }

    }
    
    private var settingMovie: some View {
        Button {
            self.movieName = viewModel.movieModel[viewModel.currentIndex].movieName
        } label: {
            Text("대표 영화로 설정")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(.black)
                .padding(.top, 21)
                .padding(.bottom, 20)
                .padding(.leading, 53)
                .padding(.trailing, 52)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .stroke(
                            .black,
                            style: .init(lineWidth: 1)
                        )
                }
        }
    }
    
    private var printAppStorageValue: some View {
        VStack(spacing: 17) {
            Text("@AppStorage에 저장된 영화")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(.black)
            
            Text("현재 저장된 영화: \(movieName)")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    MovieView()
}
