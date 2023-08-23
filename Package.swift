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
      name: "JavaScriptCoreMacros",
      targets: ["JavaScriptCoreMacros"]
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
        name: "JavaScriptCoreCompilerPlugin",
        dependencies: [
          .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
          .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
        ]
      ),
      
      .target(
        name: "JavaScriptCoreMacros", 
        dependencies: [
          "JavaScriptCoreCompilerPlugin",
        ]
      ),
      
      .executableTarget(
        name: "JSCExample", 
        dependencies: [
          "JavaScriptCoreMacros",
        ]
      ),
      
      .testTarget(
        name: "JavaScriptCoreMacrosTests",
        dependencies: [
          "JavaScriptCoreMacros",
          .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
        ]
      ),
    ]
)
