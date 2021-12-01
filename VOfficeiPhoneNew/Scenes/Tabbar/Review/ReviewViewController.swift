//
//  ReviewViewController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/1/21.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class ReviewViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    var viewModel: ReviewViewModel!
    var disposeBag = DisposeBag()
    
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
        
    }
    
    func bindViewModel() {
        let input = ReviewViewModel.Input()
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension ReviewViewController {
    
}

// MARK: - StoryboardSceneBased
extension ReviewViewController: StoryboardSceneBased {
    static var sceneStoryboard = UIStoryboard()
}
