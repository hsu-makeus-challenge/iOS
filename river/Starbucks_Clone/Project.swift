import ProjectDescription

let project = Project(
    name: "Starbucks_Clone",
    targets: [
        .target(
            name: "Starbucks_Clone",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Starbucks-Clone",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    "NSLocationWhenInUseUsageDescription": "앱이 실행 중일 때 위치 정보를 사용합니다.",
                    "NSLocationAlwaysUsageDescription": "앱이 백그라운드에서도 위치 정보를 사용합니다."
                ]
            ),
            sources: ["Starbucks_Clone/Sources/**"],
            resources: ["Starbucks_Clone/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "Starbucks_CloneTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.Starbucks-CloneTests",
            infoPlist: .default,
            sources: ["Starbucks_Clone/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Starbucks_Clone")]
        ),
    ]
)
