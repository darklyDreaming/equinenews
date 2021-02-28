//
//  NewsCell.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay: Article?
    
    func displayArticle(_ article: Article) {
        
        articleImageView.image = nil
        articleImageView.alpha = 0
        headlineLabel.text = ""
        headlineLabel.alpha = 0
        
        articleToDisplay = article
        
        headlineLabel.text = articleToDisplay?.title
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.headlineLabel.alpha = 1
        }, completion: nil)
        
        guard let urlString = articleToDisplay?.urlToImage else { return }
        
        if let imageData = CacheService.retrieveData(url: urlString) {
            
            articleImageView.image = UIImage(data: imageData)
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                self.articleImageView.alpha = 1
            }, completion: nil)
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if error == nil && data != nil {
                
                CacheService.saveData(urlString, data!)
                if self.articleToDisplay?.urlToImage == urlString {
                    
                    DispatchQueue.main.async {
                        
                        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                            self.articleImageView.alpha = 1
                        }, completion: nil)
                        self.articleImageView.image = UIImage(data: data!)
                        
                    }
                }
            }
            
        }
        dataTask.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
