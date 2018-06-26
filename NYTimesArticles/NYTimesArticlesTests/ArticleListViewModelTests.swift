//
//  ArticleListViewModelTests.swift
//  NYTimesArticlesTests
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import XCTest
@testable import NYTimesArticles

class ArticleListViewModelTests: XCTestCase {
    
    var sut: ArticleListViewModel!
    var mockAPIService: ArticleServiceMock!

    override func setUp() {
        super.setUp()
        mockAPIService = ArticleServiceMock()
        sut = ArticleListViewModel()
        sut.articleService = mockAPIService
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchArticleLsitSuccess() {
        
        mockAPIService.completeArticals = [ArticleDetail]()
        sut.fetchArticleLsit()
        XCTAssert(mockAPIService!.isFetchArticlesCalled)
    }
    
    func testFetchArticleLsitFailed () {
        
        let error = "Error"
        sut.fetchArticleLsit()
        mockAPIService.fetchFail(error)
        XCTAssert((sut.errorMessage.value != nil), error)
    }
}
