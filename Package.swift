// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "DeviceDiscoveryJsonParser",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "DeviceDiscoveryJsonParser",
            targets: ["DeviceDiscoveryJsonParser"]
        )
    ],
    targets: [
        .target(name: "DeviceDiscoveryJsonParser"),
        .testTarget(
            name: "DeviceDiscoveryJsonParserTests",
            dependencies: ["DeviceDiscoveryJsonParser"]
        )
    ]
)
