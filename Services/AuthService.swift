//
//  AuthService.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import Foundation
import UIKit
import FirebaseUI


extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        guard error == nil else {
            return
        }
        let user = authDataResult?.user
        if let user = user {
            UserService.retrieveProfile(userId: user.uid) { (newsUser) in
                if newsUser == nil {
                    self.goToCreateProfile()
                    
                } else {
                    if let existingUser = newsUser {
                        // Skip creating profile
                        LocalStorageService.saveUser(userId: existingUser.userId, username: existingUser.username, topicToRead: existingUser.topicToRead)
                        self.goToTabBar()
                    }
                }
            }
        } else {
            return
        }
        
    }
}
