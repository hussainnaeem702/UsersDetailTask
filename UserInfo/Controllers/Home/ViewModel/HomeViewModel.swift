//
//  HomeViewModel.swift
//  UserInfo
//
//  Created by Naeem Hussain on 23/03/2022.
//

import Foundation
import UIKit


class HomeViewModel: NSObject {
    
    
    func getUsers( _ completion: @escaping([HomeDataModel]?, Error?) -> ())
    {
        APIClient.shared.sendRequestToServer(APIClient.users) { success, response, error in
            
            if let homeData = response {
                
                completion(homeData, nil)
            }
            else {
                
                completion(nil, error)
            }
        }
    }
}


