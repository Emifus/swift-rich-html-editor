// swift-tools-version: 6.2

import PackageDescription

let package: Package = Package(
    name: "InfomaniakRichHTMLEditor",
    platforms: [
        .iOS(.v14),
        .visionOS(.v1),
        .macOS(.v11)
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
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "InfomaniakRichHTMLEditorTests",
            dependencies: ["InfomaniakRichHTMLEditor"]
        )
    ]
)
