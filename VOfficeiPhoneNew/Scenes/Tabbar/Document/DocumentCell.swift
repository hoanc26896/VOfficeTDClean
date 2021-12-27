//
//  DocumentCell.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/27/21.
//

import UIKit

class DocumentCell: UITableViewCell {
    lazy var titleLb: UILabel = {
        let view = UILabel()
        view.load(design: Design.documentTitle)
        return view
    }()
    
    lazy var warningTitleLb: UILabel = {
        let view = UILabel()
        view.load(design: Design.documentWarningTitle)
        return view
    }()
    
    lazy var warningContentLb: UILabel = {
        let view = UILabel()
        return view
    }()
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
