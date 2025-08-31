//
//  KeychainWrapper.swift
//  Starbuck
//
//  Created by 송승윤 on 5/8/25.
//

import Foundation
import Security

/// Keychain에 문자열 값을 저장, 불러오기, 삭제하는 유틸리티
enum KeychainKey: String {
    case email
    case password
    case nickname
}

class KeychainWrapper {
    
    /// Keychain에 문자열 저장하기
    @discardableResult
    static func save(_ value: String, for key: KeychainKey) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecValueData as String: data
        ]
        
        // 기존 항목 삭제 후 새로 저장 (중복 방지)
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
    }
    
    /// Keychain에서 문자열 불러오기
    static func load(for key: KeychainKey) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as NSDictionary, &dataTypeRef)
        
        // 값이 존재하면 문자열로 변환하여 반환
        if status == errSecSuccess,
           let data = dataTypeRef as? Data,
           let result = String(data: data, encoding: .utf8) {
            return result
        }
        
        return nil
    }
    
    /// Keychain에서 항목 삭제
    @discardableResult
    static func delete(for key: KeychainKey) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue
        ]
        return SecItemDelete(query as CFDictionary) == errSecSuccess
    }
}
