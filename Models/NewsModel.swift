//
//  NewsModel.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import Foundation
import Firebase

protocol NewsModelProtocol: class {
    func articlesFetched(_ articles: [Article])
}

class NewsModel {
    
    weak var delegate: NewsModelProtocol?
    
    func fetchArticles() {
        
        let stringURL = RequestsService.createRequest()
        
        guard let url = URL(string: stringURL) else {
            print("Error while creating URL")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error?.localizedDescription ?? "DataTask failed")
                return
            }
            guard let dataFetched = data else { return }
            
            let decoder = JSONDecoder()
            do {
                
                let articlesArray = try decoder.decode(NewsBundle.self, from: dataFetched)
                let articles = articlesArray.articles
                self.delegate?.articlesFetched(articles)
                
            } catch {
                print("Error while decoding JSON with articles")
            }
            
        }
        dataTask.resume()
    }
}
