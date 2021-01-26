//
//  Constants.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import Foundation

struct Constants {
    
    struct NewsApi {
        static let mostRecentArticles = "mostRecent"
        static let mostPopularArticles = "mostPopular"
        
        // Use this to create a custom request
        // Part 1
        static let requestAll = "http://newsapi.org/v2/everything?"
        static let requestTop = "http://newsapi.org/v2/top-headlines?"
        // Part 2
        static let dressageQuery = "q=dressage"
        static let showjumpingQuery = "q=showjumping"
        // Part 3
        static let sortedByPopularity = "&sortBy=popularity"
        static let sortedByRecent = "&sortBy=publishedAt"
    
    }
    
    
    struct Storyboard {
        
        static let goToProfileSegue = "goToCreateProfile"
        static let createProfileVC = "createProfileVC"
        static let loginNavVC = "loginNavController"
        static let mainTabBarController = "mainTabBarController"
        static let newsCell = "NewsCell"
        static let detailViewSegue = "goToDetail"
    }
    
    struct Topics {
        static let dressage = "dressage"
        static let showjumping = "showjumping"
    }
    
    struct LocalStorage {
        
        static let userIdKey = "storedUserId"
        static let usernameKey = "storedUsername"
        static let topicKey = "topicToRead"
    }
}
