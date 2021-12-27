//
//  SegmentControlItem.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/13/21.
//

import UIKit

class SegmentControlItem: UIView {
    
    var title: String = "" {
        didSet{
            if !title.isEmpty{
                segmentItemButton.setTitle(title, for: .normal)
                segmentItemButton.setTitleColor(LAsset.tabbarTitle.color, for: .normal)
            }
            
        }
    }
    
    var isSelect: Bool = false{
        didSet{
            if isSelect{
                segmentItemButton.setTitleColor(LAsset.tabbarSelTitle.color, for: .normal)
            }else{
                segmentItemButton.setTitleColor(LAsset.tabbarTitle.color, for: .normal)
            }
        }
    }
    
    lazy var segmentItemSv: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        self.addSubview(view)
        return view
    }()
    
    lazy var segmentItemButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        view.setTitleColor(LAsset.tabbarTitle.color, for: .normal)
        segmentItemSv.addArrangedSubview(view)
        return view
    }()
    
    lazy var segmentItemDevider: UIView = {
        let view = UIView()
        view.backgroundColor = LAsset.tabIndicator.color
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
            make.top.left.right.equalToSuperview()
            make.height.equalTo(43.5)
        }
        
        segmentItemDevider.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
}
