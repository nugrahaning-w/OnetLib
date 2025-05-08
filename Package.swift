// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnetLib",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OnetLib",
            targets: ["Onet"]),
    ],
    targets: [
        // The destination of the framework you will obfuscate the code
        .binaryTarget(name: "Onet", path: "./Sources/Onet.xcframework")
    ]
)
