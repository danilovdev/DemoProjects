//
//  WebService.swift
//  GoodNews
//
//  Created by Aleksei Danilov on 18.02.2022.
//

import Foundation

final class WebService {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                if let articleList = try? JSONDecoder().decode(ArticleList.self, from: data) {
                    completion(articleList.articles)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
        dataTask.resume()
    }
}
