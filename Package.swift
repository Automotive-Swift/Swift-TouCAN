// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Swift-TouCAN",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Swift-TouCAN",
            targets: [
                "CTouCAN",
                "TouCAN",
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Automotive-Swift/Swift-CAN", .branch("master"))
    ],
    targets: [
        .target(
            name: "CTouCAN",
            dependencies: [],
            exclude: ["README.md"],
            cSettings: [
                // unconditional
                CSetting.headerSearchPath("."),
                CSetting.headerSearchPath("privateInclude"),
                CSetting.define("OPTION_CAN_2_0_ONLY=0"),
                CSetting.define("OPTION_CANAPI_TOUCAN_AUTO_INIT=0"),
                CSetting.define("OPTION_CANAPI_TOUCAN_AUTO_FINALIZE=1"),
                CSetting.define("OPTION_CANAPI_DRIVER=1"),
                CSetting.define("OPTION_CANAPI_COMPANIONS=1"),
                CSetting.define("OPTION_MACCAN_MULTICHANNEL=0"),
                CSetting.define("OPTION_MACCAN_PIPE_TIMEOUT=0"),
                CSetting.define("OPTION_MACCAN_INSTRUMENTATION=0"),
                CSetting.define("OPTION_CANAPI_INSTRUMENTATION=0"),
                // only for debug
                CSetting.define("OPTION_MACCAN_LOGGER=1", .when(platforms: nil, configuration: .debug)),
                CSetting.define("OPTION_MACCAN_DEBUG_LEVEL=5", .when(platforms: nil, configuration: .debug)),
                CSetting.define("OPTION_CANAPI_DEBUG_LEVEL=5", .when(platforms: nil, configuration: .debug)),
                CSetting.define("OPTION_CANAPI_RETVALS=1", .when(platforms: nil, configuration: .debug)),
            ]
        ),
        .target(
            name: "TouCAN",
            dependencies: [
                "CTouCAN",
                "Swift-CAN"
            ],
            path: "Sources/SwiftTouCAN",
            exclude: ["README.md"]
        ),
        .testTarget(
            name: "TouCAN-Tests",
            dependencies: ["TouCAN"]
        )
    ],
    cxxLanguageStandard: .cxx14
)
