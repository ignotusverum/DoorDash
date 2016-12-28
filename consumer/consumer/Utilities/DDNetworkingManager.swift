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
    
    static let shared = DDNetworkingManager()
    
    let manager = Alamofire.SessionManager.default
    
    func baseUrl(_ version: String) -> String {
        
        return String(format: "https://%@/%@/", hostName, version)
    }
    
    func URLWithPath(_ path: String, version: String)-> URL {
        
        let urlResult = URL(string: self.URLString(path, version: version))
        if let urlResult = urlResult {
            
            return urlResult
        }
        
        return URL(string: baseUrl(version))!
    }
    
    func URLString(_ path: String, version: String)-> String {
        
        return String(format: "%@%@", self.baseUrl(version), path)
    }
    
    // MARK: - HTTP Request + Promise
    func request(_ method: HTTPMethod, path URLString: String, parameters: [String: Any]? = nil, version: String = hostVersion) -> Promise<JSON> {
        
        let path = self.URLString(URLString, version: version)
        
        return Promise { fulfill, reject in
            self.manager.request(path, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
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
    // Unauthorized response notification
    func postUnauthorizedResponseNotification() {
        
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name(rawValue: DDUnauthorizedNotificationKey), object: nil)
    }
}
