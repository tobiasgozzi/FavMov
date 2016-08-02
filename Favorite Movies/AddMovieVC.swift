//
//  AddMovieVC.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 26.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var insertedTitle: UITextField!
    @IBOutlet weak var insertedDescription: UITextField!
    @IBOutlet weak var insertedPlot: UITextField!
    @IBOutlet weak var insertedIMDBURL: UITextField!
    @IBOutlet weak var previewPic: UIImageView!
    
    
    var savedURL: NSURL!
    var imgPicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AddMovieVC.updateURLTextField(_:)), name: "URL saved", object: savedURL)
    }
    
    @IBAction func lookForURL(sender: AnyObject) {
        performSegueWithIdentifier("showWKWebView", sender: nil)
    }
    
    func updateURLTextField(data: NSNotification){
        if let dict = data.userInfo as? Dictionary<String,String!> {
            if let url = dict["adress"]! {
                insertedIMDBURL.text = url
            }
        } else {
            insertedIMDBURL.text = "http://www.imdb.com"
        }
    }
    
    @IBAction func saveMovie(sender: AnyObject) {
        if let titleText = insertedTitle.text where titleText != "" {
            if let descText = insertedDescription.text where descText != "" {
                if let plotText = insertedPlot.text where plotText != "" {
                    if let imdbURL = insertedIMDBURL.text where imdbURL != "" {
                        
                        if let app = UIApplication.sharedApplication().delegate as? AppDelegate {
                            let context = app.managedObjectContext
                            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)
                            let movie = Movie(entity: entity!, insertIntoManagedObjectContext: context)
                            
                            movie.desc = descText
                            movie.settingImg(previewPic.image!)
                            movie.link = imdbURL
                            movie.plot = plotText
                            movie.title = titleText
                            
                            do {
                                try context.save()
                                exitInput("")
                            } catch let err as NSError{
                                print(err.description)
                            }
                        }
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
    
    @IBAction func pickImage(sender: AnyObject) {
        self.presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        previewPic.image = image
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        
    }
}