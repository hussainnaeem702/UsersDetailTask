//
//  APIClient.swift
//  UserInfo
//
//  Created by Naeem Hussain on 23/03/2022.
//

import Foundation
import UIKit


class APIClient: NSObject {
    
    static let shared = APIClient()
    static let users = "https://api.github.com/users"
    
    func sendRequestToServer(_ url: String, _ completionHandler: @escaping(Bool, [HomeDataModel]?, Error?) -> ())
    {
        let session = URLSession.shared
        let url = URL(string: url)!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
    
            if let data = data
            {
                let jsonDecoder = JSONDecoder()
                do {
                    
                    let resonseModel = try jsonDecoder.decode([HomeDataModel].self, from: data)
                    
                    completionHandler(true, resonseModel, error)
                }
                catch let error as NSError {
                    
                    completionHandler(false, nil, error)
                }
                
            }
            else {
                completionHandler(false, nil, error)
            }
        })
        task.resume()
        
    }
}
