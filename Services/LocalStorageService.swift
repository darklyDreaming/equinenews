//
//  LocalStorageService.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import Foundation
import UIKit

class LocalStorageService {
    static func saveUser(userId: String?, username: String?, topicToRead: String?) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(userId, forKey: Constants.LocalStorage.userIdKey)
        defaults.set(username, forKey: Constants.LocalStorage.usernameKey)
        defaults.set(topicToRead, forKey: Constants.LocalStorage.topicKey)

    }
    
    static func loadUser() -> EquineNewsUser? {
        
        let defaults = UserDefaults.standard
        
        let username = defaults.value(forKey: Constants.LocalStorage.usernameKey) as? String
        let userId = defaults.value(forKey: Constants.LocalStorage.userIdKey) as? String
        let topicToRead = defaults.value(forKey: Constants.LocalStorage.topicKey) as? String
        
        if userId != nil && username != nil && topicToRead != nil {
            // Success, return the user
            return EquineNewsUser(userId: userId, username: username, topicToRead: topicToRead)
        } else {
            return nil
        }
    }
    
    static func clearUser() {
        
        let defaults = UserDefaults.standard
        
        defaults.setValue(nil, forKey: Constants.LocalStorage.userIdKey)
        defaults.setValue(nil, forKey: Constants.LocalStorage.usernameKey)
        defaults.setValue(nil, forKey: Constants.LocalStorage.topicKey)
        
}
}
