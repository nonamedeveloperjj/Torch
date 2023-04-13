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
        .package(url: "https://github.com/nonamedeveloperjj/TorchNetwork", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "Timeline",
            dependencies: [
                .product(name: "TorchNetwork", package: "TorchNetwork")
            ],
            swiftSettings: [.unsafeFlags(["-enable-testing"])]),
        .testTarget(
            name: "TimelineTests",
            dependencies: ["Timeline"]),
    ]
)
