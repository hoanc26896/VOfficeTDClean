//
//  SegmentControlView.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/13/21.
//

import UIKit
import RxSwift

class SegmentControlView: UIView {
    
    // MARK: - IBOutlets
    lazy var segmentScoll: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.bounces = false
       
        self.addSubview(view)
        return view
    }()
    
    lazy var segmentIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        segmentScoll.addSubview(view)
        return view
    }()
    
    // MARK: - Properties
    var disposeBag = DisposeBag()
    var items = PublishSubject<[SegmentControlItem]>()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configView()
        bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView(){
        self.addBorder(to: .bottom, color: LAsset.tabIndicator.color, thickness: 0.5)
    }
    
    private func bindViewModel(){
        items.subscribe { [weak self] arrayItem in
            self?.commonInit(items: arrayItem)
        }.disposed(by: disposeBag)

    }
    
    private func commonInit(items: [SegmentControlItem]){
        guard items.count > 0 else { return }
       
       
        var widthScroll = 0.0
        for (index, item) in items.enumerated(){
            let widthItem = item.title.widthOfString(usingFont: Design.DefaultFont.title) + 75
            print("widthItem", widthItem)
//            segmentControlSv.addSubview(item)
            segmentScoll.addSubview(item)
            item.snp.remakeConstraints { make in
                make.top.equalToSuperview()
                make.left.equalTo(widthScroll)
                make.width.equalTo(widthItem)
                make.height.equalTo(44)
            }
            
            UIView.animate(withDuration: 5, delay: 0,usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut) {
                if item.isSelect {
                    
                    self.segmentIndicator.snp.remakeConstraints { make in
                        make.centerX.equalTo(item)
                        make.width.equalTo(widthItem-10)
                        make.height.equalTo(5)
                        make.bottom.equalTo(item.snp.bottom)
                    }
                }
             
            } completion: { _ in
               
            }

            item.addBorder(to: .right, color: LAsset.tabIndicator.color, thickness: 0.5, padding: 12.5)
            widthScroll += widthItem
        }
        print("widthScroll", widthScroll)
        segmentScoll.snp.remakeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
       
        
        segmentScoll.contentSize = CGSize(width: (widthScroll), height: segmentScoll.frame.height)
    }
}
