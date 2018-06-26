//
//  ArticleListViewControllerTests.swift
//  NYTimesArticlesUITests
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import XCTest

class ArticleListViewControllerTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDidSelect() {
        
        let app = XCUIApplication()
        app.launch()
        let firstChild = app.tables.children(matching: .any).element(boundBy: 0)
        if firstChild.exists {
            firstChild.tap()
        }
    }
}
