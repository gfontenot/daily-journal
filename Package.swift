import PackageDescription

let package = Package(
 name: "daily-journal",
 dependencies: [
   .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 3)
 ]
)
