//
//  UserService.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import Foundation
import FirebaseFirestore

final class UserService {
    
    static func createProfile(userId: String, username: String, topicToRead: String, completion: @escaping (EquineNewsUser?) -> Void) {
        let profileData = ["username" : username, "topicToRead" : topicToRead ]
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).setData(profileData) { (error) in
            if error == nil {
                let newUser = EquineNewsUser(userId: username, username: username, topicToRead: topicToRead)
                completion(newUser)
            } else {
                completion(nil)
            }
        }
    }
    
    static func retrieveProfile(userId: String, completion: @escaping (EquineNewsUser?) -> Void ) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { (snapshot, error) in
            
            guard error == nil else {
                return
            }
            
            if let snapshot = snapshot {
                if let userProfile = snapshot.data() {
                    let userFound = EquineNewsUser(userId: snapshot.documentID, username: userProfile["username"] as? String, topicToRead: userProfile["topicToRead"] as? String)
                    completion(userFound)
                } else {
                    // No profile
                    completion(nil)
                }
            }
        }
    }
}
