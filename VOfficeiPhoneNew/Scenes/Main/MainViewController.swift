//
//  MainViewController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit
import Reusable
import SDWebImage
import RxSwift
import RxCocoa
import MGArchitecture

private enum TabBarItem{
    case review
    case sign
    case documentary
    case calendar
    case more
    
    var title: String{
        switch self {
        case .review:
            return "Xet duyet"
        case .sign:
            return "Ky dien tu"
        case .documentary:
            return "Cong van"
        case .calendar:
            return "Lich hop"
        case .more:
            return "Them"
        default:
            return ""
        }
    }
    
    var icon: UIImage?{
        switch self {
        case .review:
            return LAsset.lgBgImg
        case .sign:
            return LAsset.lgBgImg
        case .documentary:
            return LAsset.lgBgImg
        case .calendar:
            return LAsset.lgBgImg
        case .more:
            return LAsset.lgBgImg
        default:
            return LAsset.lgBgImg
        }
    }
    
    var selectedIcon: UIImage?{
        switch self {
        case .review:
            return LAsset.lgBgImg
        case .sign:
            return LAsset.lgBgImg
        case .documentary:
            return LAsset.lgBgImg
        case .calendar:
            return LAsset.lgBgImg
        case .more:
            return LAsset.lgBgImg
        default:
            return LAsset.lgBgImg
        }
    }
    
    func getJourneyRoot(_ vc: MainViewController) -> UINavigationController{
        let rootVC: UIViewController?
        switch self {
        case .review,.sign, .documentary,.calendar,.more :
            rootVC =  vc.viewModel.navigator.toReview()
            break
        default:
            break
        }
        guard let rootVC = rootVC else {
            return UINavigationController() }
        let navigationController = UINavigationController(rootViewController: rootVC)
        return navigationController
    }
}

final class MainViewController: UITabBarController, Bindable {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    let disposeBag = DisposeBag()
    var viewModel: MainViewModel!
    private var items: [TabBarItem] = [.review, .sign, .documentary, .calendar, .more]
  
    
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
        title = "Main"
       
    }
    
    func bindViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let input = MainViewModel.Input(
            load: viewWillAppear
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.$onLoadOutput.asDriver().drive(onLoadBinder).disposed(by: disposeBag)
    }
}

extension MainViewController{
    var onLoadBinder: Binder<Void> {
        return Binder(self) { vc, _ in
            var controllers: [UIViewController] = []
            for item in vc.items {
                let root = item.getJourneyRoot(vc)
                root.tabBarItem = UITabBarItem(title: item.title,
                                               image: item.icon,
                                               selectedImage: item.selectedIcon)
                controllers.append(root)
            }
            vc.viewControllers = controllers
        }
    }
}

