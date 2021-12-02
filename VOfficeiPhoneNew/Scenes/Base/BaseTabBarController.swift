//
//  BaseTabBarController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/2/21.
//

import UIKit
import RxSwift

class BaseTabBarController: UITabBarController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        navigationController?.addAutoDetectIndicator(animated: true)
        navigationController?.clearNavigationBar(with: .white)
        super.viewDidLoad()
        configureViews()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    
    func configureViews() {
        view.backgroundColor = LAsset.background.color
    }
}
