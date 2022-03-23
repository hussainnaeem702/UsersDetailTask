//
//  ProfileTableViewCell.swift
//  UserInfo
//
//  Created by Naeem Hussain on 23/03/2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userIdLable: UILabel!
    @IBOutlet weak var nodeIdLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.bounds.height / 2
        profileImage.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        profileImage.layer.borderWidth = 1
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configData(_ userId: Int, _ nodeId: String, profile: String)
    {
        userIdLable.text = "\(userId)"
        nodeIdLable.text = nodeId
        profileImage.sd_setImage(with: URL(string: profile))
    }
    
}
