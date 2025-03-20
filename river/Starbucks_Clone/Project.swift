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
