//
//  ArticleAPIResponse.swift
//  NYTimesArticles
//
//  Created by Abhishek on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

struct ArticleAPIResponse: Codable {

    var status: String?
    var copyright: String?
    var numResults: Int?

    private enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case numResults = "num_results"
        case results
    }
    let results: [ArticleDetail]?
}

struct ArticleDetail: Codable {

    var url: String?
    var adxKeywords: String?
    var section: String?
    var byline: String?
    var type: String?
    var title: String?
    var abstract: String?
    var publishedDate: String?
    var source: String?
    var articleId: Int?
    var assetId: Int?
    var views: Int?
    private enum CodingKeys: String, CodingKey {
        case url
        case adxKeywords = "adx_keywords"
        case section
        case byline
        case type
        case title
        case abstract
        case publishedDate = "published_date"
        case source
        case articleId = "id"
        case assetId = "asset_id"
        case views
        case media
    }
    var media: [Media]?
}

struct Media: Codable {

    var type: String?
    var subtype: String?
    var caption: String?
    var copyright: String?
    var approvedForSyndication: Int?
    private enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
    var mediaMetadata: [MediaMetadata]?
}

struct MediaMetadata: Codable {

    var url: String?
    var format: String?
    var height: Int?
    var width: Int?
    private enum CodingKeys: String, CodingKey {
        case url
        case format
        case height
        case width
    }
}

struct ArticleAPIError: Codable {

    var message: String?
}
