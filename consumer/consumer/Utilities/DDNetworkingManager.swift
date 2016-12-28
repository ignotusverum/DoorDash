//
//  DDNetworkingManager.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

// Networking
import Alamofire

// Parsing
import SwiftyJSON

// Asynch
import PromiseKit

public let DDUnauthorizedNotificationKey = "DDUnauthorizedNotificationKey"

let hostName = "api.doordash.com"
let hostVersion = "v1"

class DDNetworkingManager: NSObject {
    
    private var isHeaderSet = false
    
    var headers = [
        "Content-Type": "application/json"
    ]
    
    static let sharedManager = DDNetworkingManager()
    
    let manager = Alamofire.SessionManager.default
    
    func baseUrl() -> String {
        
        return String(format: "https://%@/%@/", hostName, hostVersion)
    }
    
    func URLWithPath(path: String)-> URL {
        
        let urlResult = URL(string: self.URLString(path: path))
        if let urlResult = urlResult {
            
            return urlResult
        }
        
        return URL(string: baseUrl())!
    }
    
    func URLString(path: String)-> String {
        
        return String(format: "%@%@", self.baseUrl(), path)
    }
    
    // MARK: - HTTP Request + Promise
    func request(_ method: HTTPMethod, path URLString: String, parameters: [String: Any]? = nil, setHeaders: Bool = true) -> Promise<JSON> {
        
        return Promise { fulfill, reject in
            self.manager.request(self.URLWithPath(path: URLString), method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .validate()
                .responseJSON { response in
                    
                    switch response.result {
                        
                    case .success:
                        if let value = response.result.value {
                            let json = JSON(value)
                            fulfill(json)
                        }
                        
                    case .failure(let error):
                        
                        reject(error)
                    }
            }
        }
    }
    
    // MARK: - Utilities
    func postUnauthorizedResponseNotification() {
        
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name(rawValue: DDUnauthorizedNotificationKey), object: nil)
    }
}
