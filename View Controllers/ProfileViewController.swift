//
//  ProfileViewController.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var favTopicLabel: UILabel!
    @IBOutlet weak var username: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = LocalStorageService.loadUser()
        if let user = user {
            if user.username != nil && user.topicToRead != nil && Auth.auth().currentUser?.displayName != nil {
                let userDisplayName = Auth.auth().currentUser?.displayName
                nameLabel.text = "Name: \(userDisplayName!)"
                username.text = "Username: \(user.username!)"
                favTopicLabel.text = "Favourite topic: \(user.topicToRead!)"
            }
        }
        nameLabel = Styles.styleStandardLabel(label: nameLabel)
        username = Styles.styleStandardLabel(label: username)
        favTopicLabel = Styles.styleStandardLabel(label: favTopicLabel)
        signOutButton = Styles.styleButton(button: signOutButton)
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            LocalStorageService.clearUser()
            let loginNavVC = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginNavVC)
            self.view.window?.rootViewController = loginNavVC
            self.view.window?.makeKeyAndVisible()
            
        } catch {
            print("Error while signing out")
        }
    }
}
