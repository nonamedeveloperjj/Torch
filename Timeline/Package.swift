// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Timeline",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Timeline",
            targets: ["Timeline"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nonamedeveloperjj/Torch.Network", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Timeline",
            dependencies: []),
        .testTarget(
            name: "TimelineTests",
            dependencies: ["Timeline"]),
    ]
)
