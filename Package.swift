// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MontpellierDesignSystem",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "MontpellierDesignSystem",
            targets: ["MontpellierDesignSystem"]
        )
    ],
    targets: [
        .target(
            name: "MontpellierDesignSystem",
            path: "MontpellierDesignSystem"
        )
    ]
)
