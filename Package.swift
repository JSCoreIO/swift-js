// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "swift-jsc",
  platforms: [
    .macOS(.v10_15), 
    .iOS(.v16), 
    .tvOS(.v12), 
    .watchOS(.v4), 
    .macCatalyst(.v13),
  ],
  products: [
    .library(
      name: "SwiftJSC",
      targets: ["SwiftJSC"]
    ),
    .executable(
      name: "jsc-example",
      targets: ["JSCExample"]
    ),
  ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-syntax.git", branch: "release/5.9"),
    ],
    targets: [

      .macro(
        name: "JSCCompilerPlugin",
        dependencies: [
          .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
          .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
        ]
      ),
      
      .target(
        name: "SwiftJSC", 
        dependencies: [
          "JSCCompilerPlugin",
        ],
        swiftSettings: [
          .interoperabilityMode(.Cxx),
        ]
      ),
      
      .executableTarget(
        name: "JSCExample", 
        dependencies: [
          "SwiftJSC",
        ],
        swiftSettings: [
          .interoperabilityMode(.Cxx),
        ]
      ),
      
      .testTarget(
        name: "SwiftJSCTests",
        dependencies: [
          "SwiftJSC",
          .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
        ]
      ),
    ]
)
