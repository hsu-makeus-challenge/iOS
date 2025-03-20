import ProjectDescription

let project = Project(
    name: "Starbuck",
    targets: [
        .target(
            name: "Starbuck",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Starbuck",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Starbuck/Sources/**"],
            resources: ["Starbuck/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "StarbuckTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.StarbuckTests",
            infoPlist: .default,
            sources: ["Starbuck/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Starbuck")]
        ),
    ]
)
