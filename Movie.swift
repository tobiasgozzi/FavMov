//
//  Movie.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 24.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    
    func settingImg(img: UIImage) {
        self.img = UIImagePNGRepresentation(img)
    }
    
    func getImg() -> UIImage {
        let img = UIImage(data: self.img!)!
        return img
    }
}
