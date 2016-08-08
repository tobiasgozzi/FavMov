//
//  MovieTextField.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 08.08.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit

class MovieTextField: UITextField {


    override func awakeFromNib() {
        let backUIColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        let font = UIFont(name: "Futura-Medium", size: 16)
        
        self.layer.backgroundColor = backUIColor.CGColor
        self.layer.cornerRadius = 5
        self.textColor = UIColor(red:0.34, green:0.34, blue:0.44, alpha:1.0)
        self.font = font
        
    }
}
