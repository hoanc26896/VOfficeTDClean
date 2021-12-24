//
//  SegmentControlView.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/13/21.
//

import UIKit
import RxSwift
import SnapKit

class SegmentControlView: UIView {
    
    // MARK: - IBOutlets
    lazy var segmentScoll: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.bounces = false
       
        self.addSubview(view)
        return view
    }()
    
    // MARK: - Properties
    var disposeBag = DisposeBag()
    var items:[SegmentControlItem] = []{
        didSet{
            self.commonInit(items: items)
        }
    }
    
    var currentIndex = -1 {
        didSet{
            self.configSelected(index: currentIndex)
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView(){
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configSelected(index: Int){
        if index > -1 && index < items.count{
            for (i, item) in items.enumerated(){
                if index == i{
                    item.isSelect = true
                }else{
                    item.isSelect = false
                }
            }
        }
    }
    
    private func commonInit(items: [SegmentControlItem]){
        guard items.count > 0 else { return }
        var widthScroll = 0.0
        for (index, item) in items.enumerated(){
            let widthItem = item.title.widthOfString(usingFont: Design.DefaultFont.title) + 75
           
            segmentScoll.addSubview(item)
            item.snp.remakeConstraints { make in
                make.top.equalToSuperview()
                make.left.equalTo(widthScroll)
                make.width.equalTo(widthItem)
                make.height.equalTo(44)
            }
            widthScroll += widthItem
        }
      
        segmentScoll.snp.remakeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
       
        segmentScoll.contentSize = CGSize(width: widthScroll, height: segmentScoll.frame.height)
    }
}
