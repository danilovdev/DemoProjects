//
//  Article.swift
//  GoodNews
//
//  Created by Aleksei Danilov on 18.02.2022.
//

import Foundation

struct Article: Decodable {
    let title: String
    let description: String
}

struct ArticleList: Decodable {
    let articles: [Article]
}
