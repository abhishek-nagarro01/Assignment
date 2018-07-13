//
//  ServiceRequest.swift
//  NYTimesArticles
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation
import Alamofire

class ServiceRequest: NSObject {

    var methodPath = URLConstants.none

    var url: URL {
        let url = ProjectConstants.kBaseUrl + methodPath.urlString()
        return URL(string: url)!
    }

    var manager: Alamofire.SessionManager {
        return Alamofire.SessionManager.default
    }

    public func executeRequest(requestType: HTTPMethod,
                               parameters: [String: Any]?,
                               header: [String: String]?,
                               completion: @escaping (Data?, String?) -> Void) {

        if NetworkReachabilityManager()!.isReachable {
            manager.request(url,
                            method: requestType,
                            parameters: parameters,
                            encoding: URLEncoding.default,
                            headers: header).response { (response) in
                                if response.error != nil {
                                    completion(nil, response.error?.localizedDescription)
                                    return
                                }
                                if response.response?.statusCode == 200 {
                                    completion(response.data, nil)
                                } else {
                                    let error = "\(String(describing: response.response?.statusCode))"
                                    completion(response.data, error)
                                }
            }
        } else {
            completion(nil, "No internet connection")
        }
    }
}
