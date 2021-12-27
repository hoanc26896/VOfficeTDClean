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
    
    lazy var segmentIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = LAsset.tabbarSelTitle.color
        segmentScoll.addSubview(view)
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
        
    }
    
    private func configSelected(index: Int){
        if index > -1 && index < items.count{
            var widthScroll = 0.0
            for (i, item) in items.enumerated(){
                let widthItem = item.title.widthOfString(usingFont: Design.DefaultFont.title) + 75
                if index == i{
                    item.isSelect = true
                    UIView.animate(withDuration: 0.3) {
                        self.segmentIndicator.frame = CGRect(x: widthScroll, y: CGFloat(self.segmentScoll.frame.maxY - 5), width: widthItem, height: 5)
                    } completion: { _ in
                        
                    }
                }else{
                    item.isSelect = false
                }
                widthScroll += widthItem
            }
            self.layoutIfNeeded()
        }
    }
    
    private func commonInit(items: [SegmentControlItem]){
        guard items.count > 0 else { return }
        segmentScoll.snp.remakeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
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
            item.addBorder(to: .right, color: LAsset.tabIndicator.color, thickness: 0.5, padding: 12.5)
            if (currentIndex == index){
                UIView.animate(withDuration: 0.3) {
                    self.segmentIndicator.frame = CGRect(x: widthScroll, y: CGFloat(self.segmentScoll.frame.maxY - 5), width: widthItem, height: 5)
                } completion: { _ in
                    
                }
            }
            widthScroll += widthItem
        }
      
        segmentScoll.contentSize = CGSize(width: widthScroll, height: segmentScoll.frame.height)
        self.segmentIndicator.frame = CGRect(x: 0, y: CGFloat(self.segmentScoll.frame.maxY - 5), width: CGFloat(items[0].title.widthOfString(usingFont: Design.DefaultFont.title) + 75), height: 5)
        self.layoutIfNeeded()
    }
}
