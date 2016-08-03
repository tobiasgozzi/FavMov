//
//  DetailedMovieDescVC.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 26/07/16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit

class DetailedMovieDescVC: UIViewController {
    

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDesc: UILabel!
    @IBOutlet weak var detialIMBDLink: UIButton!
    @IBOutlet weak var detailPlot: UILabel!
    
    var movieIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

    @IBAction func closeDetailedVC(sender: AnyObject){
        print(movieIndex)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
