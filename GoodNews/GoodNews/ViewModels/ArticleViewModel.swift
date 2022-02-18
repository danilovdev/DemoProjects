//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Aleksei Danilov on 18.02.2022.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        article.title
    }
    
    var description: String {
        article.description
    }
}
