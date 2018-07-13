//
//  ArticleListViewModel.swift
//  NYTimesArticles
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

class ArticleListViewModel {

    var articleList: Box<[ArticleDetail]?> = Box(nil)
    var errorMessage: Box<String?> = Box(nil)
    var articleService = ArticleService()

    func fetchArticleLsit() {

        articleService.fetchArticleList { [unowned self] (articleList, error) in
            if let articles = articleList, (articleList?.count)! > 0 {
                self.articleList.value = articles
            } else {
                self.errorMessage.value = error
            }
        }
    }
}
