//
//  MovieCollectionCell.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit

struct MovieCellViewModel {
    var imageUrl: String
    var movieName: String
}

class MovieCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelMovie: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: MovieCellViewModel) {
        labelMovie.text = model.movieName
    }
}
