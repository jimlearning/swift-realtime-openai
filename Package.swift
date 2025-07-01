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
        .library(name: "OpenAIRealtimeWebSocket", type: .static, targets: ["OpenAIRealtimeWebSocket"]),
        .library(name: "OpenAIRealtimeWebRTC", type: .static, targets: ["OpenAIRealtimeWebRTC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/stasel/WebRTC.git", branch: "latest")
    ],
    targets: [
        .target(
            name: "OpenAIRealtime",
            dependencies: [],
            path: "./src",
            exclude: [
                "Connectors/WebSocketConnector.swift",
                "Connectors/WebRTCConnector.swift",
            ]
        ),
        .target(
            name: "OpenAIRealtimeWebSocket",
            dependencies: ["OpenAIRealtime"],
            path: "./src/Connectors",
            sources: ["WebSocketConnector.swift"]
        ),
        .target(
            name: "OpenAIRealtimeWebRTC",
            dependencies: [
                "OpenAIRealtime",
                .product(name: "WebRTC", package: "WebRTC"),
            ],
            path: "./src/Connectors",
            sources: ["WebRTCConnector.swift"]
        ),
    ]
)
