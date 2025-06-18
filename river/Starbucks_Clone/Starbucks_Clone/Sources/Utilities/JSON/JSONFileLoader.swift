//
//  GeoJSONLoader.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/3/25.
//

import Foundation

final class JSONFileLoader {
    static let shared = JSONFileLoader()

    private init() {}
    
    func load<T: Decodable>(
        named fileName: String,
        fileExtension: String = "json",
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            completion(.failure(NSError(domain: "파일을 찾을 수 없습니다.", code: 404, userInfo: nil)))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decoded))
        } catch {
            completion(.failure(error))
        }
    }
}

