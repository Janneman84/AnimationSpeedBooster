// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnimationSpeedBooster",
    platforms: [
        .iOS(.v12), .tvOS(.v12)
    ],
    products: [
        .library(
            name: "AnimationSpeedBooster",
            targets: ["InitializerASB"]
        )
    ],
    targets: [
        .target(
            name: "InitializerASB",
            dependencies: ["AnimationSpeedBooster"]
        ),
        .target(
            name: "AnimationSpeedBooster",
            dependencies: []
        )
    ]
)
