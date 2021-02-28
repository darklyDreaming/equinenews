//
//  NewsBundle.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 25.01.2021.
//

import Foundation

struct NewsBundle: Decodable {
    
    var totalResults: Int?
    var articles: [Article]
    
}
