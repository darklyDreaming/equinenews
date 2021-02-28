//
//  CreateProfileViewController.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import UIKit
import FirebaseAuth

class CreateProfileViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var chooseTopicLabel: UILabel!
    @IBOutlet weak var createProfileButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var topicSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureView()
        
    }
    
    private func configureView() {
        
        welcomeLabel = Styles.styleStandardLabel(label: welcomeLabel)
        chooseTopicLabel = Styles.styleStandardLabel(label: chooseTopicLabel)
        createProfileButton = Styles.styleButton(button: createProfileButton)
        
    }
    
    @IBAction func createProfileTapped(_ sender: Any) {
        
        if let currentUser = Auth.auth().currentUser {
            
            let username = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            guard let validUsername = username else { return }
            if validUsername == "" { return }
            
            var topicToRead = ""
            if topicSelector.selectedSegmentIndex == 0 {
                topicToRead = Constants.Topics.dressage
            } else {
                topicToRead = Constants.Topics.showjumping
            }
            
            UserService.createProfile(userId: currentUser.uid, username: validUsername, topicToRead: topicToRead) { (user) in
                
                guard let validUser = user else { return }
                LocalStorageService.saveUser(userId: validUser.userId, username: validUser.username, topicToRead: topicToRead)
                let tabBarVC = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.mainTabBarController)
                self.view.window?.rootViewController = tabBarVC
                self.view.window?.makeKeyAndVisible()

            }
        }
    }
    
}
