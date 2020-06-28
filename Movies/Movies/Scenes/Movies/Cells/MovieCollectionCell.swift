//
//  MovieCollectionCell.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit
import SDWebImage

struct MovieCellViewModel {
    var imageUrl: URL?
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
        imageViewPoster.sd_setImage(with: model.imageUrl, placeholderImage: nil)
    }
}
