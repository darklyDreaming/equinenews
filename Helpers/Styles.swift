//
//  Styles.swift
//  EquineNews
//
//  Created by Yulia Tsyrkunova on 24.01.2021.
//

import Foundation
import UIKit

class Styles {
    
    static func styleButton(button: UIButton) -> UIButton {
        let button = button
        let font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }
    
    static func styleStandardLabel(label: UILabel) -> UILabel {
        let label = label
        let font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.font = font
        label.textColor = .black
        return label
    }
    
    static func styleHeader(label: UILabel) -> UILabel {
        let label = label
        let font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.font = font
        label.textColor = .black
        return label
    }
}
