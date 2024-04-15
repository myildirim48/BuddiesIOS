import SwiftUI

@propertyWrapper
public struct LocalizedString {
    public let key: String
    public init(key: String) { self.key = key }

    public var wrappedValue: Text { Text(LocalizedStringKey(self.key), bundle: .module) }
    public var projectedValue: LocalizedString { self }
    public var localized: String { NSLocalizedString(self.key, bundle: .module, comment: "") }
    public func format(_ arguments: CVarArg...) -> String { String(format: localized, arguments: arguments) }
    public func callAsFunction(_ arguments: CVarArg...) -> String { String(format: localized, arguments: arguments) }
}

// MARK: - Localized strings keys

public enum L {
    /// About
    @LocalizedString(key: "About") public static var about: Text
    /// Feed
    @LocalizedString(key: "Feed") public static var feed: Text
    /// BuddiesIOS
    @LocalizedString(key: "onboardingItem.SecondTitle") public static var onboardingitem_secondtitle: Text
    /// Contributors
    @LocalizedString(key: "Contributors") public static var contributors: Text
    /// Dive in, explore, learn and share. We're excited to have you here and can't wait to see what you'll bring to the table. 
    @LocalizedString(key: "onboardingItem.SecondDescription") public static var onboardingitem_seconddescription: Text
    /// Buddies Community, being a platform dedicated to iOS development, aims to provide a productive environment fostering networking, collaboration, and knowledge sharing. 
    @LocalizedString(key: "onboardingItem.FirstDescription") public static var onboardingitem_firstdescription: Text
    /// Map
    @LocalizedString(key: "Map") public static var map: Text
    /// Next
    @LocalizedString(key: "onboarding.ButtonTitle") public static var onboarding_buttontitle: Text
    /// Welcome!
    @LocalizedString(key: "onboardingItem.FirstTitle") public static var onboardingitem_firsttitle: Text
    /// Start
    @LocalizedString(key: "onboarding.StartButtonTitle") public static var onboarding_startbuttontitle: Text
}