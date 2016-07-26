//
//  DetailedMovieDescVC.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 26/07/16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit

class DetailedMovieDescVC: UIViewController {
    
    var movie: Movie!

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
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
