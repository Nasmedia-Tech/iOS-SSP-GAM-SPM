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
            from: "2.1.4"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationGAMBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-AdMixerDownload/raw/main/AdMixerMediationGAM1.0.3.xcframework.zip",
            checksum: "d6acab8fcf5f637fc169718c046969fda4369e426c9770a15edeca92cf4c8200"
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
