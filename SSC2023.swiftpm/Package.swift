// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "SSC2023",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "SSC2023",
            targets: ["AppModule"],
            bundleIdentifier: "com.brunance.SSC2023",
            teamIdentifier: "YP9Q3ST2DG",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .images),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)
