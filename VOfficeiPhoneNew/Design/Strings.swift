// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
internal enum L10n {
  /// Username
  internal static let coreLoginAccount = L10n.tr("Localizable", "core.login.account")
  /// English
  internal static let coreLoginEnglish = L10n.tr("Localizable", "core.login.english")
  /// Login
  internal static let coreLoginLogin = L10n.tr("Localizable", "core.login.login")
  /// Password
  internal static let coreLoginPassword = L10n.tr("Localizable", "core.login.password")
  /// Tiếng Việt
  internal static let coreLoginVietnammese = L10n.tr("Localizable", "core.login.vietnammese")
}
// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
