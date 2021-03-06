//
//  ViewController.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 24.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()
    
    var detailedMovieVC: DetailedMovieDescVC!
    var addMovieVC: AddMovieVC!
    var webView: MyWebVC!
    
    var paramURL: String!
    var indexOfMovie: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        
        fetchMovies()
        tableView.reloadData()
        
    }
    
    func fetchMovies() {
        let app = UIApplication.sharedApplication().delegate as? AppDelegate
        let context = app?.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")

        do {
            let movieData = try context?.executeFetchRequest(fetchRequest) as? [Movie]
            
            movies = movieData!
            
        } catch let err as NSError {
            print(err.description)
        }
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = movies.count as? Int {
            return count
        } else {
            return 0
        }

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("movieMainScreenCell") as? myMovieCell {
            cell.configureCell(movies[indexPath.row])
            
            return cell
        } else {
            return myMovieCell()
        }
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //let selectedMovie = movies[indexPath.row]
        
        detailedMovieVC = DetailedMovieDescVC()
        //prepareForSegue(UIStoryboardSegue(identifier: "ToDetailedView", source: self, destination: detailedMovieVC), sender: selectedMovie)
        showDetailVC(indexPath.row)
    }
    
    
    
    @IBAction func presentAddMovieVC(sender: AnyObject) {
        addMovieVC = AddMovieVC()
        performSegueWithIdentifier("ToAddMovieVC", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToWebView" {
            if let destinationVC = segue.destinationViewController as? MyWebVC {
                destinationVC.IMDBURL = paramURL
            }
        } else if segue.identifier == "ToDetailedView" {
            if let destinationVC = segue.destinationViewController as? DetailedMovieDescVC {
                destinationVC.movieIndex = indexOfMovie
            }
        }
        
        
    }
    func showDetailVC(index: Int){
        indexOfMovie = index
        performSegueWithIdentifier("ToDetailedView", sender: nil)

    }
    
    @IBAction func showWebPage(sender: UIButton){
        paramURL = sender.titleForState(.Reserved)
        performSegueWithIdentifier("segueToWebView", sender: /*sender.titleForState(.Reserved)*/nil)
    }

}

