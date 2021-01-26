//
//  FeedViewController.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = NewsModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        model.delegate = self
        model.fetchArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tableView.indexPathForSelectedRow
        guard indexPath != nil else {
            return
        }
        
        let article = articles[indexPath!.row]
        let detailVC = segue.destination as! DetailViewController
        
        guard article.url != nil else {
            return
        }
        
        detailVC.articleUrl = article.url
        
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Storyboard.newsCell, for: indexPath) as! NewsCell
        let article = articles[indexPath.row]
        cell.displayArticle(article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
                currentCell?.backgroundColor = .lightGray
            } completion: { (completed) in
                self.performSegue(withIdentifier: Constants.Storyboard.detailViewSegue, sender: self)
            }
        }
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                currentCell?.backgroundColor = .white
            }, completion: nil)
        }
    }
}

// MARK:  - News Model Protocol Methods

extension FeedViewController: NewsModelProtocol {
    func articlesFetched(_ articles: [Article]) {
        self.articles = articles
        tableView.reloadData()
    }
}

