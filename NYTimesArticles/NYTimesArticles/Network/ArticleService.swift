//
//  ArticleService.swift
//  NYTimesArticles
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

class ArticleService {

    var serviceRequest: ServiceRequest?
    init(sericeRequest: ServiceRequest = ServiceRequest()) {
        self.serviceRequest = sericeRequest
        self.serviceRequest?.methodPath = URLConstants.articleList
    }

    func fetchArticleList(completion: @escaping ([ArticleDetail]?, String?) -> Void) {

        self.serviceRequest?.executeRequest(requestType: .get,
                                            parameters: nil,
                                            header: nil) { (responseData, errorMessage) in

                                                if errorMessage == nil {
                                                    let decoder = JSONDecoder()
                                                    let articleResponse = try? decoder.decode(ArticleAPIResponse.self,
                                                                                              from: responseData!)
                                                    completion(articleResponse?.results, nil)
                                                } else {
                                                    let decoder = JSONDecoder()
                                                    let errorResponse = try? decoder.decode(ArticleAPIError.self,
                                                                                            from: responseData!)
                                                    if let error = errorResponse, let msg = error.message {
                                                        completion(nil, msg)
                                                    } else {
                                                        completion(nil, "Server error")
                                                    }
                                                }
        }

    }
}
