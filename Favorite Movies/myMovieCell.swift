//
//  myMovieCell.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 24.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit
import CoreData

class myMovieCell: UITableViewCell {

    @IBOutlet weak var movieImg: MyMovieIV!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieIMDB_URL: UIButton!
        
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        movieTitle.sizeToFit()
    }
    
    
    func configureCell(movie: Movie) {
        movieImg.layer.cornerRadius = 4.0
        movieImg.clipsToBounds = true
        

        self.movieDesc.text = movie.desc
        self.movieTitle.text = movie.title
        self.movieIMDB_URL.setTitle("go to IMDB", forState: .Normal)
        self.movieIMDB_URL.setTitle(movie.link, forState: .Reserved)
        self.movieImg.image = movie.getImg()
    }

    

}
