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
    
    // MARK: - Properties
    
    var viewModel: LoginViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    // MARK: - Variable
    var isUserShowAlert = true
    var isPassShowAlert = true
    
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
        
    }
    
    private func configLocalizeToView(){
        smLanguage.setTitle(localize(key: "lg_tieng_viet", comment: "Viettnammese segment title"), forSegmentAt: 0)
        smLanguage.setTitle(localize(key: "lg_tieng_anh", comment: "Englist segment title"), forSegmentAt: 1)
        
        tfUsername.placeholder = localize(key: "lg_tai_khoan", comment: "Placeholder username textfield")
        tfPassword.placeholder = localize(key: "lg_mat_khau", comment: "Placeholder password textfield")
        btnLogin.setTitle(localize(key: "lg_dang_nhap", comment: "Title button login"), for: .normal)
    }
    
    func bindViewModel() {
        let input = LoginViewModel.Input(
            username: tfUsername.rx.text.orEmpty.asDriver(), password: tfPassword.rx.text.orEmpty.asDriver(), login: btnLogin.rx.tap.asDriver()
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$usernameValidationMessage.asDriver().drive(usernameValidationMessageBinder).disposed(by: disposeBag)
        
        output.$passwordValidationMessage.asDriver().drive(passwordValidationMessageBinder).disposed(by: disposeBag)
        
        output.$isLoginEnabled.asDriver().drive(loginEnabledBinder).disposed(by: disposeBag)
        
        output.$isLoading.asDriver().drive(rx.isLoading).disposed(by: disposeBag)
        
        output.$error.asDriver().unwrap().drive(rx.error).disposed(by: disposeBag)
        
    }
}

// MARK: - Binders
extension LoginViewController {
    var usernameValidationIsValidBinder: Binder<Bool>{
        return Binder(self) { vc, isValid in
            vc.isUserShowAlert = !isValid
        }
    }
    
    var usernameValidationMessageBinder: Binder<String> {
        return Binder(self) { vc, message in
            if !vc.isUserShowAlert {return}
            vc.showError(message: message)
        }
    }
    
    var passwordValidationIsValidBinder: Binder<Bool>{
              return Binder(self) { vc, isValid in
                  vc.isPassShowAlert = !isValid
              }
          }
    
    var passwordValidationMessageBinder: Binder<String> {
        return Binder(self) { vc, message in
            if !vc.isPassShowAlert {return}
            vc.showError(message: message)
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
}

// MARK: - StoryboardSceneBased
extension LoginViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.login
}
