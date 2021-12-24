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
    var disposeBag = DisposeBag()
    
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
    var pages: [PageModel] = []{
        didSet{
            self.didSetPages(pages: pages)
        }
    }
    private var pageViews: [UIViewController] = []
    private var segmentItems: [SegmentControlItem] = []
    private var currentIndex = BehaviorRelay<Int>(value: 0)
    
    public init(pages: [PageModel]? = []){
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
        view.backgroundColor = LAsset.tabbarBg.color
        
        segmentControlView.snp.makeConstraints { make in
            make.top.equalTo(66)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        pageViewController.view.snp.makeConstraints { make in
            make.top.equalTo(segmentControlView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func configData(){
        
    }
    
    public func didSetPages(pages: [PageModel]){
        if pages.isEmpty {return}
        let enablePages = pages.filter { item in
            item.status == PageModelStatus.enable
        }
        let segments = enablePages.enumerated().map { (index, item) -> SegmentControlItem in
            let sg = SegmentControlItem()
            sg.title = item.tilte
            sg.segmentItemButton.rx.tap.subscribe { [weak self] _ in
                guard let currentIndex = self?.currentIndex.value else { return }
                self?.setSelected(index, direction: index > currentIndex ? .forward: .reverse, animate: true)
            }.disposed(by: disposeBag)
            
            return sg
        }
        setSegments(segmentControlItems: segments)
        
        let pageViews = enablePages.map { item in
            item.viewController
        }
        setPageViews(pageViews: pageViews)
    }
    
    private func setPageViews(pageViews: [UIViewController] = []){
        self.pageViews = pageViews
        if (currentIndex.value < pages.count){
            pageViewController.setViewControllers([pageViews[currentIndex.value]], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func setSegments(segmentControlItems: [SegmentControlItem] = []){
        self.segmentItems = segmentControlItems
        if (!segmentControlItems.isEmpty && currentIndex.value < segmentControlItems.count){
            segmentControlView.items = segmentControlItems
            segmentControlView.currentIndex = currentIndex.value
        }
    }
    
    public func setSelected(_ pageIndex: Int, direction: UIPageViewController.NavigationDirection = .forward, animate: Bool = true) {
        if pageIndex < pageViews.count{
            guard let page = self.pageViews[pageIndex] as? UIViewController else { return }
            self.currentIndex.accept(pageIndex)
            self.pageViewController.setViewControllers([page], direction: direction, animated: animate, completion: nil)
            segmentControlView.currentIndex = pageIndex
        }
    }
}

extension BasePageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("viewControllerBefore")
        guard let viewControllerIndex = pageViews.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard pageViews.count > previousIndex else { return nil }
        currentIndex.accept(previousIndex)
        segmentControlView.currentIndex = previousIndex
        return pageViews[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print("viewControllerAfter")
        guard let viewControllerIndex = pageViews.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pageViews.count else { return nil }
        
        guard pageViews.count > nextIndex else { return nil }
        currentIndex.accept(nextIndex)
        segmentControlView.currentIndex = nextIndex
        return pageViews[nextIndex]
    }
    
    
}

extension BasePageViewController: UIPageViewControllerDelegate{
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        print("presentationCount ",pageViews.count)
        return pageViews.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        print("presentationIndex pageViewController",pageViewController)
        guard let firstVC = pageViewController.viewControllers?.first else {
            return 0
        }
        guard let firstVCIndex = pageViews.firstIndex(of: firstVC) else {
            return 0
        }
        
        return firstVCIndex
    }
}
