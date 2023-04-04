// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
	func runTests() {
        desc("Build project and run unit tests")
        scan(
            scheme: "TorchTests",
            devices: .userDefined(["iPhone 14"]),
            skipDetectDevices: true,
            codeCoverage: .userDefined(true),
            buildlogPath: "./fastlane/fastlane-buildlog",
            derivedDataPath: "./DerivedData",
            sdk: "iphoneos",
            configuration: "Debug"
        )
	}
}
