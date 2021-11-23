// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
internal enum L10n {
  /// Alert
  internal static let coreCommonAlert = L10n.tr("Localizable", "core.common.alert")
  /// Can not connect to internet, please try again
  internal static let coreCommonCannotConnectToInternet = L10n.tr("Localizable", "core.common.cannot_connect_to_internet")
  /// Can not connect to network, please check and try again
  internal static let coreCommonCannotConnectToNetwork = L10n.tr("Localizable", "core.common.cannot_connect_to_network")
  /// Close
  internal static let coreCommonClose = L10n.tr("Localizable", "core.common.close")
  /// Type Again
  internal static let coreCommonInputAgain = L10n.tr("Localizable", "core.common.input_again")
  /// No
  internal static let coreCommonNo = L10n.tr("Localizable", "core.common.no")
  /// Try again
  internal static let coreCommonTryAgain = L10n.tr("Localizable", "core.common.try_again")
  /// Warning
  internal static let coreCommonWarning = L10n.tr("Localizable", "core.common.warning")
  /// Yes
  internal static let coreCommonYes = L10n.tr("Localizable", "core.common.yes")
  /// Username
  internal static let coreLoginAccount = L10n.tr("Localizable", "core.login.account")
  /// Connecting ...
  internal static let coreLoginConnecting = L10n.tr("Localizable", "core.login.connecting")
  /// You do not enter password
  internal static let coreLoginDoNotEnterPassword = L10n.tr("Localizable", "core.login.do_not_enter_password")
  /// You do not enter account
  internal static let coreLoginDoNotEnterUsername = L10n.tr("Localizable", "core.login.do_not_enter_username")
  /// English
  internal static let coreLoginEnglish = L10n.tr("Localizable", "core.login.english")
  /// You must enter at least 8 characters
  internal static let coreLoginEnterMin8Number = L10n.tr("Localizable", "core.login.enter_min_8_number")
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
