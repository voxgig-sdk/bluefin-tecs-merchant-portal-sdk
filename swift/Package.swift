// swift-tools-version:5.9
//
// BluefinTecsMerchantPortal SDK - SwiftPM manifest. The runtime itself is dependency-free
// (Foundation + the vendored Voxgig Struct port under
// Sources/ProjectNameSDK/Struct); declared feature/target deps (if any)
// appear below.
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
