//
//  MainViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import RxSwift
import RxCocoa
import MGArchitecture
import UIKit

protocol MainViewModelProtocol{
    func getJourneyRoot(item: TabBarItem) -> UIViewController
    func getRootViewcontrollers() -> [UIViewController]
}

struct MainViewModel {
    let navigator: MainNavigatorType
    let useCase: MainUseCaseType
}

// MARK: - ViewModel
extension MainViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        @Property var rootViewControllers: [UIViewController] = []
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        let onLoad = input.load.map { _ in
            self.getRootViewcontrollers()
        }.asDriver()
        onLoad.drive(output.$rootViewControllers).disposed(by: disposeBag)
        return output
    }
}

extension MainViewModel: MainViewModelProtocol{
    func getRootViewcontrollers() -> [UIViewController] {
        let items: [TabBarItem] = [.review, .sign, .documentary, .calendar, .more]
        var controllers: [UIViewController] = []
        for item in items {
            let root = self.getJourneyRoot(item: item)
            root.tabBarItem = UITabBarItem(title: item.title,
                                           image: item.icon,
                                           selectedImage: item.selectedIcon)
            controllers.append(root)
        }
        print("getRootViewcontrollers - controllers", controllers)
        return controllers
    }
    
    func getJourneyRoot(item: TabBarItem) -> UIViewController{
        var rootVC: UIViewController?
        switch item {
        case .review,.sign, .documentary,.calendar,.more :
            rootVC =  navigator.toDocument()
            break
        }
        guard let rootVC = rootVC else {
            return UINavigationController() }
        let navigationController = UINavigationController(rootViewController: rootVC)
        navigationController.viewControllers.first?.title = item.title
        
        return navigationController
    }
}

