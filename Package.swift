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
            "12.7.0"..<"13.3.1"
        ),
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.3.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationGAMBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-GAM-SPM/releases/download/1.0.9/AdMixerMediationGAM1.0.9.xcframework.zip",
            checksum: "50daf17b6cabc001c03063f3f3227f2705b69042f9b19d26f6f4063a0e1fb7fe"
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
