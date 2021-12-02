// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation
import RxSwift
import RxCocoa

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
internal enum RxL10n {
  /// Alert
  internal static let coreCommonAlert = RxL10n.tr("Localizable", "core.common.alert")
  /// Can not connect to internet, please try again
  internal static let coreCommonCannotConnectToInternet = RxL10n.tr("Localizable", "core.common.cannot_connect_to_internet")
  /// Can not connect to network, please check and try again
  internal static let coreCommonCannotConnectToNetwork = RxL10n.tr("Localizable", "core.common.cannot_connect_to_network")
  /// Close
  internal static let coreCommonClose = RxL10n.tr("Localizable", "core.common.close")
  /// Type Again
  internal static let coreCommonInputAgain = RxL10n.tr("Localizable", "core.common.input_again")
  /// No
  internal static let coreCommonNo = RxL10n.tr("Localizable", "core.common.no")
  /// Try again
  internal static let coreCommonTryAgain = RxL10n.tr("Localizable", "core.common.try_again")
  /// Warning
  internal static let coreCommonWarning = RxL10n.tr("Localizable", "core.common.warning")
  /// Yes
  internal static let coreCommonYes = RxL10n.tr("Localizable", "core.common.yes")
  /// Username
  internal static let coreLoginAccount = RxL10n.tr("Localizable", "core.login.account")
  /// Change password
  internal static let coreLoginChangePassword = RxL10n.tr("Localizable", "core.login.change_password")
  /// Connecting ...
  internal static let coreLoginConnecting = RxL10n.tr("Localizable", "core.login.connecting")
  /// You do not enter password
  internal static let coreLoginDoNotEnterPassword = RxL10n.tr("Localizable", "core.login.do_not_enter_password")
  /// You do not enter account
  internal static let coreLoginDoNotEnterUsername = RxL10n.tr("Localizable", "core.login.do_not_enter_username")
  /// English
  internal static let coreLoginEnglish = RxL10n.tr("Localizable", "core.login.english")
  /// You must enter at least 8 characters
  internal static let coreLoginEnterMin8Number = RxL10n.tr("Localizable", "core.login.enter_min_8_number")
  /// Because of entering the wrong information so many times, the account is locked.
  internal static let coreLoginErrorAccountLockedDueEnterWrongManyTime = RxL10n.tr("Localizable", "core.login.error_account_locked_due_enter_wrong_many_time")
  /// Because of entering the wrong information so many times, the account is locked. You must change your password to unlock it.
  internal static let coreLoginErrorAccountLockedDueEnterWrongManyTimeYouShouldChangePasswordToUnlock = RxL10n.tr("Localizable", "core.login.error_account_locked_due_enter_wrong_many_time_you_should_change_password_to_unlock")
  /// Your account is not correct
  internal static let coreLoginErrorEnterWrong = RxL10n.tr("Localizable", "core.login.error_enter_wrong")
  /// The account is locked because the password is expired
  internal static let coreLoginErrorLockedDueExpiredPassword = RxL10n.tr("Localizable", "core.login.error_locked_due_expired_password")
  /// The account is locked because the password is expired. You must change your password to unlock it.
  internal static let coreLoginErrorLockedDueExpiredPasswordYouShouldChangePasswordToUnlock = RxL10n.tr("Localizable", "core.login.error_locked_due_expired_password_you_should_change_password_to_unlock")
  /// Account has not been activated or locked
  internal static let coreLoginErrorNotActiveOrLocked = RxL10n.tr("Localizable", "core.login.error_not_active_or_locked")
  /// Account has not been activated or locked. You must change your password to unlock or  activate it.
  internal static let coreLoginErrorNotActiveOrLockedYouShouldChangePasswordToUnlockOrActive = RxL10n.tr("Localizable", "core.login.error_not_active_or_locked_you_should_change_password_to_unlock_or_active")
  /// Forgot password
  internal static let coreLoginForgotPassword = RxL10n.tr("Localizable", "core.login.forgot_password")
  /// Login
  internal static let coreLoginLogin = RxL10n.tr("Localizable", "core.login.login")
  /// Password
  internal static let coreLoginPassword = RxL10n.tr("Localizable", "core.login.password")
  /// Tiếng Việt
  internal static let coreLoginVietnammese = RxL10n.tr("Localizable", "core.login.vietnammese")
  /// Approve docs
  internal static let coreTabbarApproveDocs = RxL10n.tr("Localizable", "core.tabbar.approve_docs")
  /// Calendar
  internal static let coreTabbarCalendar = RxL10n.tr("Localizable", "core.tabbar.calendar")
  /// Document
  internal static let coreTabbarDocuments = RxL10n.tr("Localizable", "core.tabbar.documents")
  /// More
  internal static let coreTabbarMore = RxL10n.tr("Localizable", "core.tabbar.more")
  /// Sign
  internal static let coreTabbarSign = RxL10n.tr("Localizable", "core.tabbar.sign")
}
// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

private let currentLanguage = BehaviorRelay<String?>(value: UserDefaults.standard.languageCode)

extension RxL10n {

    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> Observable<String> {
        let producer = { () -> String in
            // swiftlint:disable:next nslocalizedstring_key
            let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
            return String(format: format, locale: Locale.current, arguments: args)
        }
        return currentLanguage.map { _ in producer() }
    }
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}

extension NSObject {

    private struct AssociatedKeys {
        static var DisposeBag = "lion_disposeBag"
    }

    private func doLocked(_ closure: () -> Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        closure()
    }

    fileprivate var bag: DisposeBag {
        get {
            var disposeBag: DisposeBag!
            doLocked {
                let lookup = objc_getAssociatedObject(self, &AssociatedKeys.DisposeBag) as? DisposeBag
                if let lookup = lookup {
                    disposeBag = lookup
                } else {
                    let newDisposeBag = DisposeBag()
                    self.bag = newDisposeBag
                    disposeBag = newDisposeBag
                }
            }
            return disposeBag
        }
        set { doLocked { objc_setAssociatedObject(self, &AssociatedKeys.DisposeBag, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) } }
    }
}

extension Bundle {

    private struct AssociatedKeys {
        static var LocalizedBundle = "lion_localizedBundle"
    }

    fileprivate static var localizedBundle: Bundle {
        if let bundle = objc_getAssociatedObject(Bundle.main, &AssociatedKeys.LocalizedBundle) as? Bundle {
        	return bundle
        }
        if let identifier = currentLanguage.value,
            let path = Bundle.main.path(forResource: identifier, ofType: "lproj"),
            let bundle = Bundle(path: path) {
            objc_setAssociatedObject(Bundle.main, &AssociatedKeys.LocalizedBundle, bundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return bundle
        }
        return Bundle.main
    }

    static func setLanguage(with identifier: String = "vi") {
        if let path = Bundle.main.path(forResource: identifier, ofType: "lproj"),
            let bundle = Bundle(path: path) {
            UserDefaults.standard.languageCode = identifier
            UserDefaults.standard.synchronize()
            objc_setAssociatedObject(Bundle.main, &AssociatedKeys.LocalizedBundle, bundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            currentLanguage.accept(identifier)
        } else {
            assert(false, "unabled to find specified localization bundle: \(identifier)")
        }
    }

    static var currentLangaugeObservable: Observable<String?> {
        return currentLanguage.asObservable()
    }

    static var currentLangauge: String? {
        return currentLanguage.value
    }
}

extension Locale {
    public static var current: Locale {
        if let language = currentLanguage.value {
            return Locale(identifier: language)
        }
        return NSLocale.current
    }
}

public func NSLocalizedString(_ key: String, tableName: String? = nil, bundle: Bundle = .main, value: String = "", comment: String = "") -> String {
    return Foundation.NSLocalizedString(
        key,
        tableName: tableName,
        bundle: Bundle.localizedBundle,
        value: value,
        comment: comment
    )
}

extension UILabel {

    var localizedText: Observable<String> {
        set { newValue.bind(to: rx.text).disposed(by: bag) }
        get { return Observable.empty() }
    }
}

extension UIButton {

    var localizedTitle: Observable<String> {
        set { newValue.bind(to: rx.title()).disposed(by: bag) }
        get { return Observable.empty() }
    }
}

extension UITextView {

    var localizedText: Observable<String> {
        set { newValue.bind(to: rx.text).disposed(by: bag) }
        get { return Observable.empty() }
    }
}

extension UITextField {

    var localizedText: Observable<String> {
        set { newValue.bind(to: rx.text).disposed(by: bag) }
        get { return Observable.empty() }
    }

    var localizedPlaceholder: Observable<String> {
        set { newValue.bind(to: rx.placeholder).disposed(by: bag) }
        get { return Observable.empty() }
    }
}

extension UISearchBar {

    var localizedText: Observable<String> {
        set { newValue.bind(to: rx.text).disposed(by: bag) }
        get { return Observable.empty() }
    }

    var localizedPlaceholder: Observable<String> {
        set { newValue.bind(to: rx.placeholder).disposed(by: bag) }
        get { return Observable.empty() }
    }
}

extension Reactive where Base: UITextField {

    var placeholder: Binder<String?> {
        return Binder(self.base) { textField, placeholder -> Void in
            textField.placeholder = placeholder
        }
    }
}

extension Reactive where Base: UISearchBar {

    var placeholder: Binder<String?> {
        return Binder(self.base) { searchBar, placeholder -> Void in
            searchBar.placeholder = placeholder
        }
    }
}

extension UserDefaults {

    fileprivate var languageCode: String? {
        get { return (UserDefaults.standard.value(forKey: "AppleLanguages") as? [String])?.first }
        set { UserDefaults.standard.set(newValue == nil ? nil : [newValue!], forKey: "AppleLanguages") }
    }
}
