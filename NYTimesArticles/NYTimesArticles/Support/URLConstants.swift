//
//  URLConstants.swift
//  NYTimesArticles
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

import Foundation

enum URLConstants {
    
    case articleList
    case none
    
    func urlString() -> String {
        var urlString = ""
        switch self {
        case .articleList:
            urlString = "/mostviewed/all-sections/7.json?api-key=54e5496eb75443aea29abca3eda6dbf6"
        case .none:
            urlString = ""
        }
        return urlString
    }
}
