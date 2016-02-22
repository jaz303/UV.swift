import PackageDescription

let package = Package(
	name: "UV",
	targets: [],
	dependencies: [
		.Package(
			url: "https://github.com/jaz303/CUV.git",
			majorVersion: 0
		)
	]
)