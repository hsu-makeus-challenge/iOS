//
//  KakaoLoginViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 5/8/25.
//

import Foundation
import UIKit
import Combine

class KakaoLoginViewModel: ObservableObject {
    var loginViewModel: LoginViewModel? // Login 상태를 갱신하기 위한 참조
    private var cancellables = Set<AnyCancellable>()
    
    // 초기화: 카카오 로그인 과정에서 받은 authorization code를 처리하기 위한 NotificationCenter 구독 설정
    init() {
        NotificationCenter.default.publisher(for: .didReceiveKakaoCode)
            .compactMap { $0.userInfo?["code"] as? String }
            .sink { [weak self] code in
                self?.requestToken(with: code) // 받은 코드로 토큰 요청 시작
            }
            .store(in: &cancellables)
    }
    
    // 카카오 로그인 페이지로 이동하는 메서드
    func loginWithKakao() {
        let clientID = ""
        let redirectURI = "https://songtarbuck.com/oauth"
        let urlStr = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=\(clientID)&redirect_uri=\(redirectURI)"
        
        // URL이 유효하면 카카오 로그인 페이지를 열어 인증 진행
        if let url = URL(string: urlStr) {
            UIApplication.shared.open(url)
        }
    }
    
    // authorization code를 이용해 asccess token을 요청
    private func requestToken(with code: String) {
        let url = URL(string: "")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        // 요청 파라미터 설정
        let params = [
            "grant_type": "authorization_code",
            "client_id": "",
            "redirect_uri": "https://songtarbuck.com/oauth",
            "code": code
        ]
        request.httpBody = params.map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .data(using: .utf8)
        
        // 토큰 요청을 비동기로 수행
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data,
                  let token = try? JSONDecoder().decode(KakaoToken.self, from: data) else { return }
            // 토큰을 성공적으로 받으면 사용자 정보 요청 시작
            self.requestUserInfo(with: token.access_token)
        }.resume()
    }
    
    private func requestUserInfo(with accessToken: String) {
        var request = URLRequest(url: URL(string: "https://kapi.kakao.com/v2/user/me")!)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        // 사용자 정보 요청을 비동기로 수행
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data,
                  let user = try? JSONDecoder().decode(KakaoUser.self, from: data) else { return }
            
            // 메인 스레드에서 로그인 상태를 갱신
            DispatchQueue.main.async {
                let nickname = user.kakao_account.profile.nickname
                self.loginViewModel?.loginWithKakao(nickname: nickname)
            }
        }.resume()
    }
}
