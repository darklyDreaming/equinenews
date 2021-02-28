//
//  LoginViewController.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import UIKit
import FirebaseUI
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureBackground()
        self.loginButton = Styles.styleButton(button: loginButton)
        
    }
    
    private func configureBackground() {
        
        let imageName = "loginBg" + String(Int.random(in: 1...4))
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.alpha = 0.4
        backgroundImageView.tintColor = .darkGray
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let authUI = FUIAuth.defaultAuthUI()
        if let authUI = authUI {
            authUI.delegate = self
            // See AuthService for delegate methods
            authUI.providers = [FUIEmailAuth()]
            let authViewController = authUI.authViewController()
            present(authViewController, animated: true, completion: nil)
        } else {
            print("UI creation failed")
            return
        }
        
    }
    
    func goToCreateProfile() {
        
        performSegue(withIdentifier: Constants.Storyboard.goToProfileSegue, sender: self)
        
    }
    
    func goToTabBar() {
        
        let tabBarVC = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.mainTabBarController)
        guard tabBarVC != nil else {
            return
        }
        tabBarVC?.tabBarController?.selectedIndex = 2
        
        self.view.window?.rootViewController = tabBarVC
        self.view.window?.makeKeyAndVisible()
    }
    
}


