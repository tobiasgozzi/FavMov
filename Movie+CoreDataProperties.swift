//
//  Movie+CoreDataProperties.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 24.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var link: String?
    @NSManaged var img: NSData?
    @NSManaged var plot: String?

}
