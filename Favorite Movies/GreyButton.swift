//
//  GreyButton.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 24.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit

class GreyButton: UIButton {

 let btnLabelFont = UIFont(name: "Futura-Medium", size: 16)

    let btnBgColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
    let btnTextColor = UIColor(red: 86/255, green: 86/255, blue: 112/255, alpha: 1)

    override func awakeFromNib() {
        
        self.backgroundColor = btnBgColor
        self.setTitleColor(btnTextColor, forState: .Normal)
        self.layer.cornerRadius = 4.0
        self.titleLabel?.font = btnLabelFont
    }

    
}
