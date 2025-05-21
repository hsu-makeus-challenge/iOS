//
//  Dependencies.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/21/25.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(
            url: "https://github.com/Moya/Moya.git",
            requirement: .upToNextMajor(from: "15.0.0")
        ),
    ],
    platforms: [.iOS]
)
