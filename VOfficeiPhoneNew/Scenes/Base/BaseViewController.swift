//
//  BaseViewController.swift
//  Life
//
//  Created by Duc Minh Nguyen on 8/19/21.
//

import UIKit
import RxSwift
import SnapKit

class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    var backgroundImageName: String = "bg_default"
    lazy var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.alpha = 0.8
        self.view.addSubview(view)
        view.snp.makeConstraints { $0.edges.equalToSuperview() }
        return view
    }()

    override func viewDidLoad() {
        navigationController?.addAutoDetectIndicator(animated: true)
        navigationController?.clearNavigationBar(with: .white)
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func configureViews() {
        view.backgroundColor = LAsset.background.color
        
    }
}
