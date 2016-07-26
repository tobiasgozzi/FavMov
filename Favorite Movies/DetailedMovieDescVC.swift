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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeDetailedVC(sender: AnyObject){
        navigationController?.popViewControllerAnimated(true)
//        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
