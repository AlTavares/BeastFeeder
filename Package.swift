// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BeastFeeder",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0"),
        .package(url: "https://github.com/uraimo/SG90Servo.swift.git", from: "3.0.0"),
        .package(url: "https://github.com/httpswift/swifter.git", from: "1.4.7"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "BeastFeeder",
            dependencies: ["SwiftyGPIO",
                           "SG90Servo",
                           "Swifter",
                           "Logging"]
        ),
    ]
)
