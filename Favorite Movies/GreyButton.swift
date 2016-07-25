//
//  GreyButton.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 24.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit

class GreyButton: UIButton {

    override func awakeFromNib() {
        self.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        self.setTitleColor(UIColor(red: 86/255, green: 86/255, blue: 112/255, alpha: 1), forState: .Normal)
        self.layer.cornerRadius = 4.0
    }

    
}
