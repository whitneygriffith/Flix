//
//  MovieCell.swift
//  Flix
//
//  Created by Whitney Griffith on 9/6/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie! {
        willSet(movie){
            posterImageView.af_setImage(withURL: movie.posterUrl!)
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
        }
    }


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

