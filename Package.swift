// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdMixerMediationGAM",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AdMixerMediationGAM",
            targets: ["AdMixerMediationGAM"]),
    ],
    dependencies: [
        // Google Mobile Ads SDK
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            from: "11.3.0"
        ),
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.0.7"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationGAM",
            url: "https://github.com/Nasmedia-Tech/iOS-AdMixerDownload/raw/main/AdMixerMediationGAM1.0.1.xcframework.zip",
            checksum: "c1e486fed219f1a07b293679b8d0a8e244ed789b21c50276d9540560ec57087d"
        ),
        .target(
            name: "iOS-SSP-GAM-SPM",
            dependencies: [
                "AdMixerMediationGAM",
                .product(name: "GoogleMobileAds",
                         package: "swift-package-manager-google-mobile-ads"),
                .product(name: "AdMixerMediation",
                         package: "ios-ssp-mediation-spm")
            ],
            path: "Sources/iOS-SSP-GAM-SPM"
        )
    ]
)
