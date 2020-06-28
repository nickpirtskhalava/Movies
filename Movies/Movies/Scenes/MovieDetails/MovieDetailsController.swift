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
    @IBOutlet weak var labelFavorite: UILabel!
    @IBOutlet weak var buttonFavorite: UIButton!
    
    
    var presenter: MovieDetailsPresenter!
    private var configurator: MovieDetailsConfigurator!
    
    static func storyBoardInstance(with configurator: MovieDetailsConfigurator) -> MovieDetailsController {
        let storyboard = UIStoryboard.init(name: AppConsts.UI.StoryBoard.main, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: AppConsts.UI.StoryBoard.Id.movieDetails) as! MovieDetailsController
            vc.configurator = configurator
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(for: self)
        presenter.viewDidLoad()
    }
    
    @IBAction func didTapAdd(_ sender: UIButton) {
        presenter.didTapAddMovie()
    }
}


extension MovieDetailsController: MovieDetailsView {
    
    func display(data: MovieDetailsViewModel) {
        labelTitle.text = data.movieTitle
        labelOriginalTitle.text = data.movieOriginalTitle
        labelOverview.text = data.movieOverView
        labelRating.text = "Rating: \n \(data.movieRating)"
        labelReleaseDate.text = "Release Date: \n \(data.movieReleaseDate)"
        imageViewPoster.sd_setImage(with: data.movieImageUrl, completed: nil)
    }
    
    func display(state: FavoriteState) {
        labelFavorite.text = state.rawValue 
        labelFavorite.textColor = state.color
        buttonFavorite.isUserInteractionEnabled = state == .canAdd
    }
}
