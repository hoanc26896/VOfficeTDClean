//
//  LoginViewController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/26/21.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then
import MBProgressHUD

final class LoginViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var smLanguage: UISegmentedControl!
    @IBOutlet weak var btnBiometric: UIButton!
    
    
    // MARK: - Properties
    
    var viewModel: LoginViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Constant
    static let VIETNAMMESE_SM_INDEX = 0
    static let ENGLIST_SM_INDEX = 1
    
    // MARK: - Variable
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configLocalizeToView()
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Methods
    
    private func configView() {
        // segment control language
//        smLanguage.selectedSegmentIndex = AppSettings.language == "vi" ? LoginViewController.VIETNAMMESE_SM_INDEX : LoginViewController.ENGLIST_SM_INDEX
        
        // biometric btn
        btnBiometric.tintColor = .systemRed
        btnBiometric.backgroundColor = .white
        btnBiometric.layer.cornerRadius = 20
        btnBiometric.isHidden = BiometricContext.isAllowBioButton()
    }
    
    private func configLocalizeToView(){
        smLanguage.setTitle(localize(key: "lg_tieng_viet", comment: "Viettnammese segment title"), forSegmentAt: LoginViewController.VIETNAMMESE_SM_INDEX)
        smLanguage.setTitle(localize(key: "lg_tieng_anh", comment: "Englist segment title"), forSegmentAt: LoginViewController.ENGLIST_SM_INDEX)
        
        tfUsername.placeholder = localize(key: "lg_tai_khoan", comment: "Placeholder username textfield")
        tfPassword.placeholder = localize(key: "lg_mat_khau", comment: "Placeholder password textfield")
        btnLogin.setTitle(localize(key: "lg_dang_nhap", comment: "Title button login"), for: .normal)
    }
    
    func bindViewModel() {
        let usernameDriver = tfUsername.rx.text.orEmpty.asDriver()
        let passwordDriver = tfPassword.rx.text.orEmpty.asDriver()
        let loginDriver = btnLogin.rx.tap.asDriver()
        let selectSegmentDriver = smLanguage.rx.selectedSegmentIndex.asDriver()
        let biometricTouchDriver = btnBiometric.rx.tap.asDriver()
        
        let input = LoginViewModel.Input.init(username: usernameDriver, password: passwordDriver, login: loginDriver, selectSegment: selectSegmentDriver, biometricTouch: biometricTouchDriver)
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$userValidation.asDriver().drive(usernameValidationMessageBinder).disposed(by: disposeBag)
        
        output.$passValidation.asDriver().drive(passwordValidationMessageBinder).disposed(by: disposeBag)
        
        //        output.$isLoginEnabled.asDriver().drive(loginEnabledBinder).disposed(by: disposeBag)
//        output.$segmentIndex.asDriver().drive(segmentIndexBinder).disposed(by: disposeBag)
        
        output.$isLoading.asDriver().drive(rx.isLoading).disposed(by: disposeBag)
        
        output.$error.asDriver().unwrap().drive(rx.error).disposed(by: disposeBag)
        
    }
}

// MARK: - Binders
extension LoginViewController {
    
    var usernameValidationMessageBinder: Binder<ValidateLoginError> {
        return Binder(self) { vc, validate in
//            vc.tfUsername.resignFirstResponder()
            if (!validate.isValid && !validate.message.isEmpty){
                vc.showError(message: validate.message)
//                vc.tfUsername.becomeFirstResponder()
            }
        }
    }
    
    var passwordValidationMessageBinder: Binder<ValidateLoginError> {
        return Binder(self) { vc, validate in
//            vc.tfPassword.resignFirstResponder()
            if (!validate.isValid && !validate.message.isEmpty){
                vc.showError(message: validate.message)
//                vc.tfPassword.becomeFirstResponder()
            }
        }
    }
    
    var loginEnabledBinder:Binder<Bool>{
        return Binder(self) { vc, isEnabled in
            vc.btnLogin.isEnabled = isEnabled
        }
    }
    
    var isLoadingBinder: Binder<Bool> {
        return Binder(self) { vc, isLoading in
            
            if (isLoading){
                let hud = MBProgressHUD.showAdded(to: vc.view, animated: true)
                hud.offset.y = -30
                vc.btnLogin.setTitle(localize(key: "lg_dang_ket_noi", comment: "Title login"), for: .normal)
            }else{
                MBProgressHUD.hide(for: vc.view, animated: true)
                vc.btnLogin.setTitle(localize(key: "lg_btn_login", comment: "Title login"), for: .normal)
            }
        }
    }
    
    var segmentIndexBinder: Binder<Int>{
        return Binder(self) { vc, segmentIndex in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                print("Reload")
                vc.viewDidLoad()
                vc.viewWillAppear(true)
            }
        
        }
    }
}

// MARK: - StoryboardSceneBased
extension LoginViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.login
}
