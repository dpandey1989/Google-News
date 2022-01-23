//
//  Article.swift
//  Google News
//
//  Created by Devendra Pandey on 19/01/22.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
