// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum LAsset {
  public static let accentColor = ColorAsset(name: "AccentColor")
  public static let background = ColorAsset(name: "background")
  public static let button = ColorAsset(name: "button")
  public static let input = ColorAsset(name: "input")
  public static let main = ColorAsset(name: "main")
  public static let lgBgColor = ColorAsset(name: "lgBgColor")
  public static let lgBgImg = ImageAsset(name: "lgBgImg").image
  public static let lgIconColor = ColorAsset(name: "lgIconColor")
  public static let lgLogoImg = ImageAsset(name: "lgLogoImg").image
  public static let lgPassIc = ImageAsset(name: "lgPassIc").image
  public static let lgUserIc = ImageAsset(name: "lgUserIc").image
  public static let menuBusinessStatistic = ImageAsset(name: "menuBusinessStatistic").image
  public static let menuCalendar = ImageAsset(name: "menuCalendar").image
  public static let menuChangePass = ImageAsset(name: "menuChangePass").image
  public static let menuCustomBar = ImageAsset(name: "menuCustomBar").image
  public static let menuDanhBa = ImageAsset(name: "menuDanhBa").image
  public static let menuDocument = ImageAsset(name: "menuDocument").image
  public static let menuHelp = ImageAsset(name: "menuHelp").image
  public static let menuIncomeStatistic = ImageAsset(name: "menuIncomeStatistic").image
  public static let menuJob = ImageAsset(name: "menuJob").image
  public static let menuMore = ImageAsset(name: "menuMore").image
  public static let menuPersonalJob = ImageAsset(name: "menuPersonalJob").image
  public static let menuPrivateSave = ImageAsset(name: "menuPrivateSave").image
  public static let menuSettings = ImageAsset(name: "menuSettings").image
  public static let menuSign = ImageAsset(name: "menuSign").image
  public static let menuStatistic = ImageAsset(name: "menuStatistic").image
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

public extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
