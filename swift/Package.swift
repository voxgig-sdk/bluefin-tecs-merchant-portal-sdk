// swift-tools-version:5.9
//
// BluefinTecsMerchantPortal SDK - SwiftPM manifest. Zero runtime dependencies (Foundation +
// the vendored Voxgig Struct port under Sources/ProjectNameSDK/Struct).
import PackageDescription

let package = Package(
    name: "BluefinTecsMerchantPortalSdk",
    products: [
        .library(name: "BluefinTecsMerchantPortalSdk", targets: ["BluefinTecsMerchantPortalSdk"]),
    ],
    targets: [
        .target(
            name: "BluefinTecsMerchantPortalSdk",
            path: "Sources/ProjectNameSDK"),
        .testTarget(
            name: "BluefinTecsMerchantPortalSdkTests",
            dependencies: ["BluefinTecsMerchantPortalSdk"],
            path: "Tests/ProjectNameSDKTests"),
    ]
)
