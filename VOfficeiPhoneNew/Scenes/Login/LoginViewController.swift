//
//  LoginViewController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class LoginViewController: BaseViewController,Bindable  {
    
    // MARK: - IBOutlets
    
    
    lazy var loginBgImg: UIImageView = {
        let image = LAsset.lgBgImg
        let view = UIImageView(image: image)
        view.contentMode = .scaleToFill
        self.view.addSubview(view)
        return view
    }()
    
    lazy var languageSegment: UISegmentedControl = {
        let control = UISegmentedControl(items: [L10n.coreLoginVietnammese, L10n.coreLoginEnglish])
        control.selectedSegmentIndex = AppSettings.language == "vi" ? 0 : 1
        control.tintColor = LAsset.button.color
        self.view.addSubview(control)
        return control
    }()
    
    lazy var loginSv: UIView = {
        let view = UIView()
        view.backgroundColor = LAsset.lgBgColor.color
        self.view.addSubview(view)
        return view
    }()
    
    lazy var loginLogo: UIImageView = {
        let image = LAsset.lgLogoImg
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        loginSv.addSubview(view)
        return view
    }()
    
    lazy var loginUsernameSv: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.systemBackground.cgColor
        view.dropShadow(color: .red, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        loginSv.addSubview(view)
        return view
    }()
    
    lazy var loginUsernameIcon: UIImageView = {
        let image = LAsset.lgUserIc.resize(to: CGSize(width: 20, height: 20))
        let view = UIImageView(image: image)
        view.contentMode =  .center
        loginUsernameSv.addArrangedSubview(view)
        return view
    }()
    
    lazy var loginUsernameTf: UITextField = {
        let view = UITextField()
        view.localizedPlaceholder = RxL10n.coreLoginAccount
        view.backgroundColor = LAsset.input.color
        view.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        loginUsernameSv.addArrangedSubview(view)
        return view
    }()
    
    lazy var loginPassSv: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.dropShadow(color: .red, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.systemBackground.cgColor
        loginSv.addSubview(view)
        return view
    }()
    
    lazy var loginPassIcon: UIImageView = {
        let image = LAsset.lgPassIc.resize(to: CGSize(width: 20, height: 20))
        let view = UIImageView(image: image)
        view.contentMode = .center
        loginPassSv.addArrangedSubview(view)
        return view
    }()
    
    lazy var loginPassTf: UITextField = {
        let view = UITextField()
        view.isSecureTextEntry = true
        view.localizedPlaceholder =  RxL10n.coreLoginPassword
        view.backgroundColor = LAsset.input.color
        view.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        loginPassSv.addArrangedSubview(view)
        return view
    }()
    
    lazy var loginBtn: UIButton = {
        let view = UIButton()
        view.localizedTitle = RxL10n.coreLoginLogin
        view.backgroundColor = LAsset.button.color
        loginSv.addSubview(view)
        return view
    }()
    
    // MARK: - Properties
    
    var viewModel: LoginViewModel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Methods
    
    private func configView() {
        title = "Login"
        
        loginBgImg.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        languageSegment.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.centerX).offset(15)
            make.width.equalTo(160)
            make.height.equalTo(32)
        }
        
        
        loginSv.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(280)
            make.height.equalTo(280)
        }
        
        loginLogo.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(87)
        }
        
        loginUsernameSv.snp.makeConstraints { make in
            make.top.equalTo(loginLogo.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(40)
        }
        
        loginUsernameIcon.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        loginUsernameTf.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(loginUsernameIcon.snp.right)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        loginPassSv.snp.makeConstraints { make in
            make.top.equalTo(loginUsernameSv.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(40)
        }
        
        loginPassIcon.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        loginPassTf.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(loginPassIcon.snp.right)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(loginPassSv.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(44)
        }
    }
    
    func bindViewModel() {
       
        
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let onChangeLanguage = languageSegment.rx.selectedSegmentIndex.asDriver()
        
        let onChangeUser = loginUsernameTf.rx.text.orEmpty.asDriver()
        let onChangePass = loginPassTf.rx.text.orEmpty.asDriver()
        
        let onLogin = loginBtn.rx.tap.asDriver()
        
        let input = LoginViewModel.Input(
            onLoad: viewWillAppear,
            onChangeLanguage: onChangeLanguage,
            onChangeUser: onChangeUser,
            onChangePass: onChangePass,
            onLogin: onLogin
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.$selectedSegmentIndex.asDriver().drive(languageSegment.rx.selectedSegmentIndex).disposed(by: disposeBag)
        output.$messageInvalidError.asDriver().drive(messageInvalidErrorBinder).disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension LoginViewController {
    var messageInvalidErrorBinder: Binder<String> {
        return Binder(self) { vc, message in
            vc.showError(message: message, okTitle: L10n.coreCommonInputAgain, completion: nil)
        }
    }
}
