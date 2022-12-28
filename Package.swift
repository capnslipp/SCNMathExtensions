// swift-tools-version:4.0
import PackageDescription

let package = Package(
	name: "SCNMathExtensions",
	platforms: [
		.macOS(.v10_10),
		.iOS(.v8),
		.tvOS(.v9),
		.watchOS(.v3),
	],
	products: [
		.library(name: "SCNMathExtensions", targets: [ "SCNMathExtensions" ]),
	],
	dependencies: [],
	targets: [
		.target(name: "SCNMathExtensions", dependencies: [], path: "Sources/"),
	],
	swiftLanguageVersions: [
		3,
		4,
		5,
	]
)
