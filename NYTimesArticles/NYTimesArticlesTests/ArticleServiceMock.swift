//
//  ArticleServiceMock.swift
//  NYTimesArticlesTests
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import XCTest
@testable import NYTimesArticles

class ArticleServiceMock: ArticleService {
    
    var isFetchArticlesCalled = false

    var completeArticals: [ArticleDetail] = [ArticleDetail]()
    var completeClosure: (([ArticleDetail]?, String?) -> Void)!

    override func fetchArticleList(completion: @escaping ([ArticleDetail]?, String?) -> Void) {
        isFetchArticlesCalled = true
        completeClosure = completion
    }
    
    func fetchSuccess() {
        completeClosure(completeArticals, nil )
    }
    
    func fetchFail(_ errorMessage: String) {
        completeClosure(nil, errorMessage)
    }
    
}
