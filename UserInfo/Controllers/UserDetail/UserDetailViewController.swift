//
//  UserDetailViewController.swift
//  UserInfo
//
//  Created by Naeem Hussain on 23/03/2022.
//

import UIKit
import libkern

class UserDetailViewController: UIViewController {

    // MARK: - Outlets -
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Variables -
    
    var userDetail : HomeDataModel?
    
    
    // MARK: - Controller's LifeCycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setup()
    }
    
    fileprivate func setup()
    {
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        tableView.register(UINib(nibName: "UserDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "UserDetailTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        self.title = userDetail?.login.capitalized ?? ""
    }
}

extension UserDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (userDetail != nil) ? 14 : 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userDetailCell = tableView.dequeueReusableCell(withIdentifier: "UserDetailTableViewCell", for: indexPath) as! UserDetailTableViewCell
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            
            cell.configData(userDetail!.id, userDetail!.node_id, profile: userDetail!.avatar_url)
            
            return cell
            
        case 1:
            
            userDetailCell.configData("URL :", userDetail!.url)
            
        case 2:
            
            userDetailCell.configData("HTML URL :", userDetail!.html_url)

        case 3:
            
            userDetailCell.configData("Followers url :".uppercased(), userDetail!.followers_url)
            
        case 4:
            
            userDetailCell.configData("following url :".uppercased(), userDetail!.following_url)
            
        case 5:
            
            userDetailCell.configData("gists url :".uppercased(), userDetail!.gists_url)
            
        case 6:
            
            userDetailCell.configData("starred url :".uppercased(), userDetail!.starred_url)
            
        case 7:
            
            userDetailCell.configData("subscriptions url :".uppercased(), userDetail!.subscriptions_url)
            
        case 8:
            
            userDetailCell.configData("organizations url :".uppercased(), userDetail!.organizations_url)
            
        case 9:
            
            userDetailCell.configData("repos url :".uppercased(), userDetail!.repos_url)
            
        case 10:
            
            userDetailCell.configData("events url :".uppercased(), userDetail!.events_url)
            
        case 11:
            
            userDetailCell.configData("received events url :".uppercased(), userDetail!.received_events_url)
            
        case 12:
            
            userDetailCell.configData("type :".uppercased(), userDetail!.type)
            
        default:
            
            let isSiteAdmin = userDetail!.site_admin ? "YES" : "NO"
            userDetailCell.configData("site admin :".uppercased(), isSiteAdmin)
        }
        
        return userDetailCell
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
    
}
