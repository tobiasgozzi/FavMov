//
//  AddMovieVC.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 26.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit

class AddMovieVC: UIViewController {

    @IBOutlet weak var insertedTitle: UITextField!
    @IBOutlet weak var insertedDescription: UITextField!
    @IBOutlet weak var insertedPlot: UITextField!
    @IBOutlet weak var insertedIMDBURL: UITextField!
    @IBOutlet weak var previewPic: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPicture(sender: AnyObject) {
    
    }
    
    @IBAction func saveMovie(sender: AnyObject) {
        if let titleText = insertedTitle.text where titleText != "" {
            if let descText = insertedDescription.text where descText != "" {
                if let plotText = insertedPlot.text where plotText != "" {
                    if let imdbURL = insertedIMDBURL.text where imdbURL != "" {
                        
                    }
                }
            }
        } else {
            print("not enough data")
        }
    }
    
    @IBAction func exitInput(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}