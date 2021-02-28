//
//  RequestsService.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import Foundation
import UIKit

final class RequestsService {
    
    static func createRequest() -> String {
        
        let user = LocalStorageService.loadUser()
        var request = ""
        let topic = user?.topicToRead
        
        request.append(Constants.NewsApi.requestAll)
        if topic == Constants.Topics.dressage {
            request.append(Constants.NewsApi.dressageQuery)
        } else {
            request.append(Constants.NewsApi.showjumpingQuery)
        }
        request.append(Constants.NewsApi.sortedByRecent)
        request.append(NewsApi.apiKey)
        
        return request
    }
}
