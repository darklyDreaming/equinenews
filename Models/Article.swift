//
//  Article.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 25.01.2021.
//

import Foundation

struct Article: Decodable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
}
