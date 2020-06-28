//
//  MovieDetailsController.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelOriginalTitle: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    
    
    var presenter: MovieDetailsPresenter!
    private var configurator: MovieDetailsConfigurator!
    
    static func storyBoardInstance(with configurator: MovieDetailsConfigurator) -> MovieDetailsController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MovieDetailsController") as! MovieDetailsController
            vc.configurator = configurator
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(for: self)
        presenter.viewDidLoad()
    }
}


extension MovieDetailsController: MovieDetailsView {
    
    func display(movieTitle: String) {
        self.labelTitle.text = movieTitle
    }
    
    func display(movieImageUrl: URL?) {
        imageViewPoster.sd_setImage(with: movieImageUrl, completed: nil)
    }
    
    func display(movieOriginalTitle: String) {
        labelOriginalTitle.text = movieOriginalTitle
    }
    
    func display(movieOverView: String) {
        labelOverview.text = movieOverView
    }
    
    func display(movieRating: Double) {
        labelRating.text = "Rating: \n \(movieRating)"
    }
    
    func display(movieReleaseDate: String) {
        labelReleaseDate.text = "Release Date: \n \(movieReleaseDate)" 
    }
}
