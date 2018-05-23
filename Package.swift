// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Motor",
    products: [
        .library(
            name: "Motor",
            targets: ["Motor"]),
    ],
    dependencies: [
        .package(url: "https://github.com/flintbox/ANSIEscapeCode", from: "0.1.1"),
    ],
    targets: [
        .target(
            name: "Motor",
            dependencies:["ANSIEscapeCode"]),
        .target(
            name: "motor-example",
            dependencies: ["Motor"]),
    ]
)
