//
//  BaseComponent.swift
//  Life
//
//  Created by Duc Minh Nguyen on 8/19/21.
//

import UIKit

public class BaseComponent: UIView {
    public init() {
        super.init(frame: .zero)
        configureViews()
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) { fatalError() }
    
    func configureViews() {
        backgroundColor = .clear
    }
}
