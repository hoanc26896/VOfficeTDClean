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
    lazy var segmentControlSv: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
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
        
        
        segmentScoll.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        segmentControlSv.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func bindViewModel(){
        items.subscribe { [weak self] arrayItem in
            self?.commonInit(items: arrayItem)
        }.disposed(by: disposeBag)

    }
    
    private func commonInit(items: [SegmentControlItem]){
        guard items.count > 0 else { return }
       
        let widthItem = 100.0
       
        for (index, item) in items.enumerated(){
            
            segmentControlSv.addSubview(item)
            item.snp.makeConstraints { make in
                make.top.equalToSuperview()
                
                make.left.equalTo(CGFloat(index) * widthItem)
                make.width.equalTo(widthItem)
                make.height.equalTo(44)
            }
        }
        
        segmentScoll.snp.remakeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalTo(CGFloat(items.count) * (widthItem + 10))
        }
        
        segmentControlSv.snp.remakeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalTo(CGFloat(items.count) * widthItem)
        }
    }
}
