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
            "12.7.0"..<"13.8.0"
        ),
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.4.2"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationGAMBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-GAM-SPM/releases/download/1.2.4/AdMixerMediationGAM1.2.4.xcframework.zip",
            checksum: "31fd10465f7509dde300059ca5a6f2a21d33882d6649865f71f153f40a0198ff"
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
