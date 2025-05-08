//
//  KakaoToken.swift
//  Starbuck
//
//  Created by 송승윤 on 5/8/25.
//

import Foundation

struct KakaoToken: Decodable {
    let access_token: String
}

struct KakaoUser: Decodable {
    let kakao_account: KakaoAccount
}

struct KakaoAccount: Decodable {
    let profile: KakaoProfile
}

struct KakaoProfile: Decodable {
    let nickname: String
}
