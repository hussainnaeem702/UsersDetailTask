//
//  ViewController.swift
//  UserInfo
//
//  Created by Naeem Hussain on 23/03/2022.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Outlets -
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Variables -
    
    var viewModel : HomeViewModel?
    var userData = [HomeDataModel]()
    let refreshControl = UIRefreshControl()
    
    // MARK: - Controller's LifeCycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.activityStartAnimating()
        viewModel?.getUsers({ data, error in
            
            if let homeData = data {
                self.userData = homeData
                
            }
            else {
                Utility.showAlert("Error", error?.localizedDescription ?? "Data not fetched", self)
            }
            
            DispatchQueue.main.async {
                self.view.activityStopAnimating()
                self.tableView.reloadData()
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.title = ""
    }
    
    fileprivate func setup()
    {
        viewModel = HomeViewModel()
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        self.title = "Users"
        
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
       
        
        viewModel?.getUsers({ data, error in
            
            if let homeData = data {
                self.userData = homeData
                
            }
            else {
                Utility.showAlert("Error", error?.localizedDescription ?? "Data not fetched", self)
            }
            
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.tableView.reloadData()
            }
        })
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        
        let data = userData[indexPath.row]
        cell.configCellData(data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = userData[indexPath.row]
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        vc.userDetail = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

