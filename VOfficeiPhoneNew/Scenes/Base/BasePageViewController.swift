//
//  BasePageViewController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/9/21.
//

import UIKit
import RxSwift
import RxCocoa

class BasePageViewController: UIViewController {
    let bag = Disposables()
    // Outlet
    lazy var pageVC: UIPageViewController = {
        let view = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        view.view.backgroundColor = .clear
        addChild(view)
        self.view.addSubview(view.view)
        view.didMove(toParent: self)
        return view
    }()
    
    // Property
    var currentIndex = BehaviorRelay<Int>(value: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configView()
        bindViewModel()
    }

    func configView(){
        
    }
    
    func bindViewModel(){
        pageVC.rx.didFinishAnimating.subscribe(onNext: { index in
            if currentIndex.value != index {
                didScrollToPage(index)
            }
        }).disposed(by: bag)
        
        pageVC.rx.configurl
    }
    
    func getPageOfIndex(_ index: Int) -> UIViewController? {
        return nil
    }
    
    func didScrollToPage(_ index: Int) {
        currentIndex.accept(index)
    }
}
