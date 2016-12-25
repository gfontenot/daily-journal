import PackageDescription

let package = Package(
 name: "daily-journal",
 dependencies: [
   .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 4),
   .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1, minor: 4)
 ]
)
