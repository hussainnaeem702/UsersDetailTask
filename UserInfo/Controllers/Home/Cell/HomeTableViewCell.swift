//
//  HomeTableViewCell.swift
//  UserInfo
//
//  Created by Naeem Hussain on 23/03/2022.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {

    
    // MARK: - Outlets -
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userUrl: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.cornerRadius = profileImage.bounds.height / 2
        profileImage.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        profileImage.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellData(_ data : HomeDataModel)
    {
        userNameLabel.text = data.login.capitalized
        userUrl.text = data.html_url
        profileImage.sd_setImage(with: URL(string: data.avatar_url))
    }

}
