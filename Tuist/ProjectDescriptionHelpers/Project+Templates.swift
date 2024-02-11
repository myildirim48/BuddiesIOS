import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(
        name: String,
        platform: Platform,
        additionalTargets: [Target],
        targetDependencies: [TargetDependency]? = nil
    ) -> Project {
        var targetDependencies = targetDependencies ?? []
        targetDependencies.append(contentsOf: additionalTargets.compactMap({ TargetDependency.target(name: $0.name) }))
        var targets = makeAppTargets(name: name,
                                     platform: platform,
                                     dependencies: targetDependencies)
        
        
        targets += additionalTargets
        return Project(name: name,
                       organizationName: "SwiftBuddies",
                       targets: targets)
    }

    // MARK: - Private

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform, dependencies: [TargetDependency]) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: Plist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]
        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "com.swiftbuddies.\(name.lowercased())",
            deploymentTarget: .iOS(targetVersion: "17.0", devices: .iphone, supportsMacDesignedForIOS: true),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
//            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "com.swiftbuddies.\(name.lowercased())Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [
                .target(name: "\(name)")
        ])
        return [mainTarget]
    }
}
