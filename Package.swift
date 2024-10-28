// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorIosApnToken",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorIosApnToken",
            targets: ["CapacitorApnTokenPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "CapacitorApnTokenPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/CapacitorApnTokenPlugin"),
        .testTarget(
            name: "CapacitorApnTokenPluginTests",
            dependencies: ["CapacitorApnTokenPlugin"],
            path: "ios/Tests/CapacitorApnTokenPluginTests")
    ]
)