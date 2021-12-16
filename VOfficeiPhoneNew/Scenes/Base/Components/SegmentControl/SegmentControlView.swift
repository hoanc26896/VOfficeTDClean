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
        
        self.addSubview(view)
        return view
    }()
    lazy var segmentControlSv: UIView = {
        let view = UIView()
//        segmentScoll.addSubview(view)
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
            let widthItem = item.title.widthOfString(usingFont: Design.DefaultFont.title) + 40
            print("widthItem", widthItem)
//            segmentControlSv.addSubview(item)
            segmentScoll.addSubview(item)
            item.snp.remakeConstraints { make in
                make.top.equalToSuperview()
                make.left.equalTo(widthScroll)
                make.width.equalTo(widthItem)
                make.height.equalTo(44)
            }
            widthScroll += widthItem
        }
        print("widthScroll", widthScroll)
        segmentScoll.snp.remakeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
//        segmentControlSv.snp.remakeConstraints { make in
//            make.top.left.right.bottom.equalToSuperview()
//
//        }
        
        segmentScoll.contentSize = CGSize(width: (widthScroll + CGFloat(items.count) * 10.0), height: segmentScoll.frame.height)
    }
}
