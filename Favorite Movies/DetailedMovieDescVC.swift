//
//  DetailedMovieDescVC.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 26/07/16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit
import CoreData

class DetailedMovieDescVC: UIViewController {
    

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDesc: UILabel!
    @IBOutlet weak var detialIMBDLink: UIButton!
    @IBOutlet weak var detailPlot: UILabel!
    
    @IBOutlet weak var plotTitle: UILabel!
    @IBOutlet weak var descrTitle: UILabel!
    
    var movieIndex: Int!
    var movies: [Movie]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let app = UIApplication.sharedApplication().delegate as? AppDelegate
        let context = app?.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let movieData = try context?.executeFetchRequest(fetchRequest) as? [Movie]
            movies = movieData
        } catch let err as NSError {
            print(err)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let mov = movies[movieIndex]
        

        detailTitle.text = mov.title
        detailDesc.text = mov.desc
        detailPlot.text = mov.plot
        detailImage.image = mov.getImg()
        detailImage.clipsToBounds = true
        detialIMBDLink.setTitle(mov.link, forState: .Reserved)

        detailPlot.sizeToFit()
        detailDesc.sizeToFit()

    }
    

    @IBAction func closeDetailedVC(sender: AnyObject){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
