// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AdMixerMediationGAM",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AdMixerMediationGAM",
            targets: ["iOS_SSP_GAM_SPM"]),
    ],
    dependencies: [
        // Google Mobile Ads SDK
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            exact: "12.14.0"
        ),
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.1.2"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationGAMBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-AdMixerDownload/raw/main/AdMixerMediationGAM1.0.2.xcframework.zip",
            checksum: "4013c401ce6ecd4ae878325f0ecb0ba901db93e5153e0b1a4a869b46ad8b6939"
        ),
        .target(
            name: "iOS_SSP_GAM_SPM",
            dependencies: [
                "AdMixerMediationGAMBinary",
                .product(name: "GoogleMobileAds",
                         package: "swift-package-manager-google-mobile-ads"),
                .product(name: "AdMixerMediation",
                         package: "ios-ssp-mediation-spm")
            ],
            path: "Sources/iOS-SSP-GAM-SPM"
        )
    ]
)
