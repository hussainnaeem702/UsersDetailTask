//
//  UserDetailTableViewCell.swift
//  UserInfo
//
//  Created by Naeem Hussain on 23/03/2022.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configData(_ title : String, _ detail: String)
    {
        titleLabel.text = title
        detailLabel.text = detail
    }
    
}
