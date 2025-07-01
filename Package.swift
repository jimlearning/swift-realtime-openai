// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "OpenAIRealtime",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .macOS(.v14),
        .watchOS(.v10),
        .visionOS(.v1),
        .macCatalyst(.v16),
    ],
    products: [
        .library(name: "OpenAIRealtime", type: .static, targets: ["OpenAIRealtime"]),
    ],
    dependencies: [
        .package(url: "https://github.com/stasel/WebRTC.git", branch: "latest"),
    ],
    targets: [
        .target(name: "OpenAIRealtime", dependencies: ["WebRTC"], path: "./src"),
    ]
)
