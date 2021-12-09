//
//  DocumentViewController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/2/21.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class DocumentViewController: BaseViewController, Bindable {
    let screenSize: CGRect = UIScreen.main.bounds
    // MARK: - IBOutlets
   
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame:CGRect(x: 0, y: 0, width: screenSize.width - 40, height: 44))
        view.isTranslucent = false
        return view
    }()
    
    lazy var leftBarButtonItem: UIBarButtonItem = {
        let view = UIBarButtonItem(customView: UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 32)))
        return view
    }()
    
    lazy var rightBarButtonItem: UIBarButtonItem = {
        let view = UIBarButtonItem(customView: searchBar)
        searchBar.center = CGPoint(x: self.view.center.x, y: searchBar.center.y)
        return view
    }()
    
    // MARK: - Properties
    
    var viewModel: DocumentViewModel!
   
    
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
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func bindViewModel() {
        let input = DocumentViewModel.Input()
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension DocumentViewController {
    
}

// MARK: - StoryboardSceneBased
extension DocumentViewController: StoryboardSceneBased {
    static var sceneStoryboard = UIStoryboard()
}
