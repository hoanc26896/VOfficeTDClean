//
//  SegmentControlItem.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/13/21.
//

import UIKit

class SegmentControlItem: UIView {
    
    lazy var segmentItemSv: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        self.addSubview(view)
        return view
    }()
    
    lazy var segmentItemButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        
        segmentItemSv.addArrangedSubview(view)
        return view
    }()
    
    lazy var segmentItemDevider: UIView = {
        let view = UIView()
        view.backgroundColor = LAsset.main.color
        segmentItemSv.addArrangedSubview(view)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView(){
        segmentItemSv.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        segmentItemButton.snp.makeConstraints { make in
           
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(segmentItemSv.bounds.height - 2)
        }
        
        segmentItemDevider.snp.makeConstraints { make in
            make.top.equalTo(segmentItemButton.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(2)
        }
        
        
    }
}
