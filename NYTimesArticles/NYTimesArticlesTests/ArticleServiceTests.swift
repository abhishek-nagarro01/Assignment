//
//  ArticleServiceTests.swift
//  NYTimesArticlesTests
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import XCTest
@testable import NYTimesArticles

class ArticleServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchArticleList() {
        
        let expectation = XCTestExpectation(description: "Articles Found")
        ArticleService().fetchArticleList { (articles, _) in
            expectation.fulfill()
            XCTAssert((articles?.count)! > 0, "Articles should not be 0")
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testFetchArticleListFailed() {
        
        let expectation = XCTestExpectation(description: "Articles Not Found")
        let articleService = ArticleService()
        articleService.serviceRequest?.methodPath = URLConstants.none
        articleService.fetchArticleList { (_, message) in
            expectation.fulfill()
            XCTAssertNotNil(message)
        }
        wait(for: [expectation], timeout: 5)
    }
}
