//
//  DetailViewController.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 25.01.2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    var articleUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let articleUrl = articleUrl {
            let url = URL(string: articleUrl)
            guard let validUrl = url else {
                print("WebView: Failed to create URL object")
                return
            }
            
            let request = URLRequest(url: validUrl)
            spinner.alpha = 1
            spinner.startAnimating()

            webView.load(request)
        }
    }
}

extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
        spinner.alpha = 0
    }
}
