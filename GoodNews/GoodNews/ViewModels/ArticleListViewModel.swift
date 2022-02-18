//
//  ArticleListViewModel.swift
//  GoodNews
//
//  Created by Aleksei Danilov on 18.02.2022.
//

import Foundation
import UIKit

final class ArticleListViewModel {
    var articles: [Article] = []
    
    func getData(completion: @escaping () -> Void) {
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-01-18&sortBy=publishedAt&apiKey=d3fdeb72a57c45b7b02a70bbf71e9c0d")!
        WebService().getArticles(url: url) { [weak self] articles in
            guard let self = self else { return }
            self.articles = (articles ?? [])
            completion()
        }
    }
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
}
