// swift-tools-version: 5.7
//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

import PackageDescription

//*============================================================================*
// MARK: * Awesome Numbers Kit
//*============================================================================*

let withSlowBuildAlerts: [SwiftSetting] = []
//.unsafeFlags(["-Xfrontend", "-warn-long-function-bodies=400"],          .when(configuration: .debug)),
//.unsafeFlags(["-Xfrontend", "-warn-long-expression-type-checking=400"], .when(configuration: .debug))]

let package = Package(
    name: "AwesomeNumbersKit",
    platforms: [
        .iOS(.v13),
        .macCatalyst(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        //=--------------------------------------=
        // ANK
        //=--------------------------------------=
        .library(
        name: "AwesomeNumbersKit",
        targets: ["AwesomeNumbersKit"]),
        //=--------------------------------------=
        // ANK x Foundation
        //=--------------------------------------=
        .library(
        name: "ANKFoundation",
        targets: ["ANKFoundation"]),
        //=--------------------------------------=
        // ANK x Full Width Kit
        //=--------------------------------------=
        .library(
        name: "ANKFullWidthKit",
        targets: ["ANKFullWidthKit"]),
        //=--------------------------------------=
        // ANK x Signed Kit
        //=--------------------------------------=
        .library(
        name: "ANKSignedKit",
        targets: ["ANKSignedKit"]),
    ],
    targets: [
        //=--------------------------------------=
        // ANK
        //=--------------------------------------=
        .target(
        name: "AwesomeNumbersKit",
        dependencies: ["ANKFoundation", "ANKFullWidthKit", "ANKSignedKit"],
        path: "Bundles/AwesomeNumbersKit"),
        //=--------------------------------------=
        // ANK x Foundation
        //=--------------------------------------=
        .target(
        name: "ANKFoundation",
        dependencies: [],
        swiftSettings: withSlowBuildAlerts),
        
        .testTarget(
        name: "ANKFoundationTests",
        dependencies: ["ANKFoundation"],
        swiftSettings: withSlowBuildAlerts),
        
        .testTarget(
        name: "ANKFoundationBenchmarks",
        dependencies: ["ANKFoundation"],
        swiftSettings: withSlowBuildAlerts),
        //=--------------------------------------=
        // ANK x Full Width Kit
        //=--------------------------------------=
        .target(
        name: "ANKFullWidthKit",
        dependencies: ["ANKFoundation"],
        swiftSettings: withSlowBuildAlerts),
        
        .testTarget(
        name: "ANKFullWidthKitTests",
        dependencies: ["ANKFullWidthKit"],
        swiftSettings: withSlowBuildAlerts),
        
        .testTarget(
        name: "ANKFullWidthKitBenchmarks",
        dependencies: ["ANKFullWidthKit"],
        swiftSettings: withSlowBuildAlerts),
        //=--------------------------------------=
        // ANK x Signed Kit
        //=--------------------------------------=
        .target(
        name: "ANKSignedKit",
        dependencies: ["ANKFoundation"],
        swiftSettings: withSlowBuildAlerts),
        
        .testTarget(
        name: "ANKSignedKitTests",
        dependencies: ["ANKFullWidthKit", "ANKSignedKit"],
        swiftSettings: withSlowBuildAlerts),
        
        .testTarget(
        name: "ANKSignedKitBenchmarks",
        dependencies: ["ANKFullWidthKit", "ANKSignedKit"],
        swiftSettings: withSlowBuildAlerts),
    ]
)
