//
//  BasePageViewController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/10/21.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import SnapKit

protocol ChildPageProtocol: Equatable {
    func pageDidAppear()
    var pageIndex: Int { get set }
}

class BasePageViewController: UIViewController {
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
    
    lazy var segmentControlView: SegmentControlView = {
        let view = SegmentControlView()
        self.view.addSubview(view)
        return view
    }()
    
    lazy var pageViewController: UIPageViewController = {
        let view = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        view.view.backgroundColor = .clear
        view.dataSource = self
        view.delegate = self
        
        addChild(view)
        self.view.addSubview(view.view)
        view.didMove(toParent: self)
        return view
    }()
    
    // MARK: - Propertise
    var pages: [UIViewController] = []
    var currentIndex = BehaviorRelay<Int>(value: 0)
    
    public init(pages: [UIViewController]? = []){
        super.init(nibName: nil, bundle: nil)
        guard let pages = pages, pages.count > 0 else { return }
        self.pages = pages
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configData()
        // Do any additional setup after loading the view.
    }
    
    private func configView() {
        navigationItem.rightBarButtonItem = rightBarButtonItem
        view.backgroundColor = LAsset.background.color
        segmentControlView.snp.makeConstraints { make in
            make.top.equalTo(66)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        pageViewController.view.snp.makeConstraints { make in
            make.top.equalTo(segmentControlView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func configData(){
        setPages(pages: self.pages)
    }
    
    public func setPages(pages: [UIViewController] = []){
        self.pages = pages
        if (currentIndex.value < pages.count){
            pageViewController.setViewControllers([pages[currentIndex.value]], direction: .forward, animated: true, completion: nil)
        }
    }
    
    public func setSegments(segmentControlItems: [SegmentControlItem] = []){
        if (currentIndex.value < segmentControlItems.count){
            segmentControlView.items.onNext(segmentControlItems)
        }
    }
    
    public func setSelected(_ pageIndex: Int, direction: UIPageViewController.NavigationDirection = .forward, animate: Bool = true) {
        if pageIndex < pages.count{
            guard let page = pages[pageIndex] as? UIViewController else { return }
            self.pageViewController.setViewControllers([page], direction: direction, animated: animate, completion: nil)
            currentIndex.accept(pageIndex)
        }
    }
}

extension BasePageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("viewControllerBefore")
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return pages.last }
        
        guard pages.count > previousIndex else { return nil }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print("viewControllerAfter")
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return pages.first }
        
        guard pages.count > nextIndex else { return nil }
        
        return pages[nextIndex]
    }
    
    
}

extension BasePageViewController: UIPageViewControllerDelegate{
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        print("presentationCount ",pages.count)
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        print("presentationIndex pageViewController",pageViewController)
        guard let firstVC = pageViewController.viewControllers?.first else {
            return 0
        }
        guard let firstVCIndex = pages.firstIndex(of: firstVC) else {
            return 0
        }
        
        return firstVCIndex
    }
}
