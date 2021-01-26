//
//  CacheService.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import Foundation
import UIKit

class CacheService {
    static var imageDictionary = [String : Data]()
    static func saveData(_ url: String, _ imageData: Data) {
        imageDictionary[url] = imageData
    }
    
    static func retrieveData(url: String) -> Data? {
        return imageDictionary[url]
    }
}
