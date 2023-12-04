// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftFileTools",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .executable(name: "SwiftFileTools", targets: ["SwiftFileTools"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.3"),
        .package(url: "https://github.com/apple/example-package-figlet", branch: "main"),
        .package(url: "https://github.com/onevcat/Rainbow", .upToNextMajor(from: "4.0.1"))
    ],
    targets: [
        .executableTarget(
            name: "SwiftFileTools",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Figlet", package: "example-package-figlet"),
                "Rainbow"
            ]
        )
    ]
)
