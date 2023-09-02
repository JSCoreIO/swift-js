// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "swift-js",

  platforms: [
    .macOS(.v10_15), 
    .iOS(.v16), 
    .tvOS(.v12), 
    .watchOS(.v4), 
    .macCatalyst(.v13),
  ],

  products: [
    .library(
      name: "SwiftJS",
      targets: ["SwiftJS"]
    ),
    .library(
      name: "JSRuntime", // maybe CxxJSRuntime
      targets: ["JSRuntime"]
    ),
    .executable(
      name: "js-example",
      targets: ["JSExample"]
    ),
  ],

  dependencies: [
    .package(url: "https://github.com/apple/swift-syntax.git", revision: "13f113e8a180d4cf1b4460d7e3db697cdf3a3fa8"),
  ],

  targets: [
    .macro(
      name: "JSCompilerPlugin",
      dependencies: [
        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
      ]
    ),
    .target(
      name: "SwiftJS", 
      dependencies: [
        "JSCompilerPlugin",
        "JSRuntime",
      ],
      swiftSettings: [
        .interoperabilityMode(.Cxx),
      ]
    ),
    .target(
      name: "JSRuntime"
    ),
    .executableTarget(
      name: "JSExample", 
      dependencies: [
        "SwiftJS",
        "JSRuntime",
      ],
      swiftSettings: [
        .interoperabilityMode(.Cxx),
      ]
    ),
    .testTarget(
      name: "SwiftJSCTests",
      dependencies: [
        "SwiftJS",
        "JSRuntime",
        .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
      ],
      swiftSettings: [
        .interoperabilityMode(.Cxx),
      ]
    ),
  ],

  cxxLanguageStandard: .cxx17
)
