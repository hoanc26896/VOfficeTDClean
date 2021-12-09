// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
internal enum L10n {
  /// Alert
  internal static let coreCommonAlert = L10n.tr("Localizable", "core.common.alert")
  /// Cancel
  internal static let coreCommonCancel = L10n.tr("Localizable", "core.common.cancel")
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
  /// Change password
  internal static let coreLoginChangePassword = L10n.tr("Localizable", "core.login.change_password")
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
  /// Because of entering the wrong information so many times, the account is locked.
  internal static let coreLoginErrorAccountLockedDueEnterWrongManyTime = L10n.tr("Localizable", "core.login.error_account_locked_due_enter_wrong_many_time")
  /// Because of entering the wrong information so many times, the account is locked. You must change your password to unlock it.
  internal static let coreLoginErrorAccountLockedDueEnterWrongManyTimeYouShouldChangePasswordToUnlock = L10n.tr("Localizable", "core.login.error_account_locked_due_enter_wrong_many_time_you_should_change_password_to_unlock")
  /// Your account is not correct
  internal static let coreLoginErrorEnterWrong = L10n.tr("Localizable", "core.login.error_enter_wrong")
  /// The account is locked because the password is expired
  internal static let coreLoginErrorLockedDueExpiredPassword = L10n.tr("Localizable", "core.login.error_locked_due_expired_password")
  /// The account is locked because the password is expired. You must change your password to unlock it.
  internal static let coreLoginErrorLockedDueExpiredPasswordYouShouldChangePasswordToUnlock = L10n.tr("Localizable", "core.login.error_locked_due_expired_password_you_should_change_password_to_unlock")
  /// Account has not been activated or locked
  internal static let coreLoginErrorNotActiveOrLocked = L10n.tr("Localizable", "core.login.error_not_active_or_locked")
  /// Account has not been activated or locked. You must change your password to unlock or  activate it.
  internal static let coreLoginErrorNotActiveOrLockedYouShouldChangePasswordToUnlockOrActive = L10n.tr("Localizable", "core.login.error_not_active_or_locked_you_should_change_password_to_unlock_or_active")
  /// Forgot password
  internal static let coreLoginForgotPassword = L10n.tr("Localizable", "core.login.forgot_password")
  /// Login
  internal static let coreLoginLogin = L10n.tr("Localizable", "core.login.login")
  /// Password
  internal static let coreLoginPassword = L10n.tr("Localizable", "core.login.password")
  /// Tiếng Việt
  internal static let coreLoginVietnammese = L10n.tr("Localizable", "core.login.vietnammese")
  /// Approve docs
  internal static let coreTabbarApproveDocs = L10n.tr("Localizable", "core.tabbar.approve_docs")
  /// Calendar
  internal static let coreTabbarCalendar = L10n.tr("Localizable", "core.tabbar.calendar")
  /// Document
  internal static let coreTabbarDocuments = L10n.tr("Localizable", "core.tabbar.documents")
  /// More
  internal static let coreTabbarMore = L10n.tr("Localizable", "core.tabbar.more")
  /// Sign
  internal static let coreTabbarSign = L10n.tr("Localizable", "core.tabbar.sign")
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
