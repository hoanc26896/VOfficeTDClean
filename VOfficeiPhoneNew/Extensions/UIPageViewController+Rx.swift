//
//  UIPageViewController+Rx.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/9/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

let dataSourceNotSet = "DataSource not set"
func rxAbstractMethod(message: String = "Abstract method", file: StaticString = #file, line: UInt = #line) -> Swift.Never {
    rxFatalError(message, file: file, line: line)
}

func rxFatalError(_ lastMessage: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) -> Swift.Never  {
    // The temptation to comment this line is great, but please don't, it's for your own good. The choice is yours.
    fatalError(lastMessage(), file: file, line: line)
}


extension UIPageViewController: HasDataSource{
    public typealias DataSource = UIPageViewControllerDataSource
}

private let pageViewDatasourceNotSet = PageViewDataSourceNotSet()

private final class PageViewDataSourceNotSet
: NSObject
, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        rxAbstractMethod(message: dataSourceNotSet)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        rxAbstractMethod(message: dataSourceNotSet)
    }
}

class RxUIPageViewControllerDatasourceProxy: DelegateProxy<UIPageViewController, UIPageViewControllerDataSource>, DelegateProxyType, UIPageViewControllerDataSource{
    static func registerKnownImplementations() {
        self.register { pageView in
            RxUIPageViewControllerDatasourceProxy(pageView: pageView)
        }
    }
    
    private weak var _requiredMethodsDataSource: UIPageViewControllerDataSource? = pageViewDatasourceNotSet
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return (_requiredMethodsDataSource ?? pageViewDatasourceNotSet).pageViewController(pageViewController, viewControllerBefore: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return (_requiredMethodsDataSource ?? pageViewDatasourceNotSet).pageViewController(pageViewController, viewControllerAfter: viewController)
    }
    
    weak public private(set) var pageView: UIPageViewController?
    
    public init(pageView: ParentObject){
        self.pageView = pageView
        super.init(parentObject: pageView, delegateProxy: RxUIPageViewControllerDatasourceProxy.self)
    }
    
    open override func setForwardToDelegate(_ forwardToDelegate: UIPageViewControllerDataSource?, retainDelegate: Bool) {
        _requiredMethodsDataSource = forwardToDelegate ?? pageViewDatasourceNotSet
        super.setForwardToDelegate(forwardToDelegate, retainDelegate: retainDelegate)
    }
}

protocol ChildPageProtocol {
    func pageDidAppear()
    var pageIndex: Int { get set }
}

extension UIPageViewController: HasDelegate{
    public typealias Delegate = UIPageViewControllerDelegate
}

class RxUIPageViewControllerDelegateProxy: DelegateProxy<UIPageViewController, UIPageViewControllerDelegate>, DelegateProxyType, UIPageViewControllerDelegate{
    static func registerKnownImplementations() {
        self.register { pageView in
            RxUIPageViewControllerDelegateProxy.init(pageView: pageView)
        }
    }
    
    weak public private(set) var pageView: UIPageViewController?
    
    public init(pageView: ParentObject){
        self.pageView = pageView
        super.init(parentObject: pageView, delegateProxy: RxUIPageViewControllerDelegateProxy.self)
    }
    
}

extension Reactive where Base: UIPageViewController{
    var delegate: DelegateProxy<UIPageViewController, UIPageViewControllerDelegate>{
        return RxUIPageViewControllerDelegateProxy.proxy(for: base)
    }
    
    func selDelegate(_ delegate: UIPageViewControllerDelegate) -> Disposable {
        RxUIPageViewControllerDelegateProxy.installForwardDelegate(delegate, retainDelegate: false, onProxyForObject: self.base)
    }
    
    var didFinishAnimating: ControlEvent<Int>{
        let source = delegate.methodInvoked(#selector(UIPageViewControllerDelegate.pageViewController(_:didFinishAnimating:previousViewControllers:transitionCompleted:)))
            .map { parameters -> Int in
                let finished = parameters[1] as! Bool
                let completed = parameters[3] as! Bool
                let pageViewController = parameters[0] as! UIPageViewController
                
                if finished, completed {
                    if let firstVC = pageViewController.viewControllers?.first as? ChildPageProtocol{
                        let newIndex = firstVC.pageIndex
                        return newIndex
                    }else{
                        return -1
                    }
                }else{
                    return -1
                }
            }
        return ControlEvent(events: source)
    }
    
    public var dataSource: DelegateProxy<UIPageViewController, UIPageViewControllerDataSource> {
        return RxUIPageViewControllerDatasourceProxy.proxy(for: base)
    }
    
    public func setDataSource(_ dataSource: UIPageViewControllerDataSource)
    -> Disposable {
        return RxUIPageViewControllerDatasourceProxy.installForwardDelegate(dataSource, retainDelegate: false, onProxyForObject: self.base)
    }
}


import Foundation
#if os(iOS) || os(tvOS)

#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

// Items
extension Reactive where Base: UIPageViewController {
    public func pages<
        DataSource: UIPageViewControllerDataSource, O : ObservableType>
    (dataSource: DataSource)
    -> ((_ source : O) -> Disposable)
    {
        return { source in
            return source.subscribeProxyDataSource(ofObject: self.base, dataSource: dataSource as UIPageViewControllerDataSource, retainDataSource: true, binding: { [weak pageViewVC = self.base] (_: RxUIPageViewControllerDatasourceProxy, event) -> Void in
                guard let pageView = pageViewVC else {
                    return
                }
                dataSource.pageViewController(pageView, observedEvent: event)
            })
        }
    }
}
#endif
