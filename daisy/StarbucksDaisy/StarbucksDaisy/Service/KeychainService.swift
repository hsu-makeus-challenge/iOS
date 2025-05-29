//
//  KeychainService.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 5/8/25.
//

import Foundation
import Security

class KeychainService {
    static let shared = KeychainService()
    
    private init() {}
    
    @discardableResult
    func save(key: String, value: String) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    @discardableResult
    func load(key: String) -> String? {
        // 검색 쿼리 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        // 검색 결과 저장 변수
        var item: CFTypeRef?
        
        // Keychain에서 항목 검색
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        // 상태 확인 및 결과 처리
        guard status == errSecSuccess else {
            print("Keychain load 실패 - status: \(status)")
            return nil
        }
        
        // Data -> String 변환
        guard let data = item as? Data,
              let result = String(data: data, encoding: .utf8) else {
            print("Keychain load 실패 - 데이터 디코딩 실패")
            return nil
        }
        
        return result
    }
    
    @discardableResult
    func delete(key: String) -> OSStatus {
        
        // 삭제할 항목을 식별할 쿼리 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        // 항목 삭제 시도
        let status = SecItemDelete(query as CFDictionary)
        
        // 상태 확인 및 로그 출력
        if status == errSecSuccess {
            print("Keychain 삭제 성공")
        } else if status == errSecItemNotFound {
            print("Keychain 항목 없음")
        } else {
            print("Keychain 삭제 실패 - status: \(status)")
        }
        
        return status
    }

}
