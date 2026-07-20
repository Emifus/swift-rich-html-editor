// swift-tools-version: 6.2

import PackageDescription

let package: Package = Package(
    name: "InfomaniakRichHTMLEditor",
    platforms: [
        .iOS(.v18),
        .visionOS(.v2),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "InfomaniakRichHTMLEditor",
            targets: ["InfomaniakRichHTMLEditor"]
        )
    ],
    targets: [
        .target(
            name: "InfomaniakRichHTMLEditor",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "InfomaniakRichHTMLEditorTests",
            dependencies: ["InfomaniakRichHTMLEditor"]
        )
    ]
)
