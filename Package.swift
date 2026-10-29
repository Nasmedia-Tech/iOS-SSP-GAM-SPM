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
            "12.7.0"..<"13.10.0"
        ),
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.6.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationGAMBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-GAM-SPM/releases/download/1.2.9/AdMixerMediationGAM1.2.9.xcframework.zip",
            checksum: "e2a66f47d0c198b86a30d38d4286226f9e09ed9eadd5b551489f15b1a3996985"
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
