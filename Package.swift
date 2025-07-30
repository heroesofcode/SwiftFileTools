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
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.6.1"),
        .package(url: "https://github.com/onevcat/Rainbow", .upToNextMajor(from: "4.2.0"))
    ],
    targets: [
        .executableTarget(
            name: "SwiftFileTools",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Rainbow"
            ]
        )
    ]
)
