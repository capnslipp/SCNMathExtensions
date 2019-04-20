// swift-tools-version:4.0
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
		3,
		4,
		5,
	]
)
