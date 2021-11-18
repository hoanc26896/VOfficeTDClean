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
  /// Close
  internal static let coreCommonClose = RxL10n.tr("Localizable", "core.common.close")
  /// Type Again
  internal static let coreCommonInputAgain = RxL10n.tr("Localizable", "core.common.input_again")
  /// No
  internal static let coreCommonNo = RxL10n.tr("Localizable", "core.common.no")
  /// Warning
  internal static let coreCommonWarning = RxL10n.tr("Localizable", "core.common.warning")
  /// Yes
  internal static let coreCommonYes = RxL10n.tr("Localizable", "core.common.yes")
  /// Username
  internal static let coreLoginAccount = RxL10n.tr("Localizable", "core.login.account")
  /// You do not enter password
  internal static let coreLoginDoNotEnterPassword = RxL10n.tr("Localizable", "core.login.do_not_enter_password")
  /// You do not enter account
  internal static let coreLoginDoNotEnterUsername = RxL10n.tr("Localizable", "core.login.do_not_enter_username")
  /// English
  internal static let coreLoginEnglish = RxL10n.tr("Localizable", "core.login.english")
  /// You must enter at least 8 characters
  internal static let coreLoginEnterMin8Number = RxL10n.tr("Localizable", "core.login.enter_min_8_number")
  /// Login
  internal static let coreLoginLogin = RxL10n.tr("Localizable", "core.login.login")
  /// Password
  internal static let coreLoginPassword = RxL10n.tr("Localizable", "core.login.password")
  /// Tiếng Việt
  internal static let coreLoginVietnammese = RxL10n.tr("Localizable", "core.login.vietnammese")
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

private final class BundleToken {}

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

    static func setLanguage(with identifier: String) {
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
