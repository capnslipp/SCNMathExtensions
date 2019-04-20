// swift-tools-version:5.0
import PackageDescription

let package = Package(
	name: "SCNMathExtensions",
	products: [
		.library(name: "SCNMathExtensions", targets: [ "SCNMathExtensions" ]),
	],
	dependencies: [],
	targets: [
		.target(name: "SCNMathExtensions", dependencies: [], path: "Sources/"),
	],
	swiftLanguageVersions: [
		.version("3"),
		.version("4"),
		.version("4.2"),
		.version("5"),
	]
)
