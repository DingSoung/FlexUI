// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "FlexUI",
    platforms: [
//        .macOS(.v10_12),
        .iOS(.v11),
//        .tvOS(.v11),
//        .watchOS(.v2)
    ],
    products: [
        .library(
            name: "FlexUI",
            targets: ["FlexUI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/DingSoung/FlexLayout", .branch("master")),
        .package(url: "https://github.com/DingSoung/Graph", .branch("master")),
        .package(url: "https://github.com/SimonFairbairn/SwiftyMarkdown", .branch("master")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "FlexUI",
            dependencies: [
                "FlexLayout",
                "Graph",
                "SwiftyMarkdown",
                "Kingfisher"
            ],
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [
        .version("5")
    ]
)
