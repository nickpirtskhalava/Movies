//
//  MovieDetailsController.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit
import SDWebImage

enum FavoriteState: String {
    case canAdd = "Add To Favorites"
    case added  = "Movie added"
}

extension FavoriteState {
    var color: UIColor {
        switch self {
        case .canAdd:
            return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        case .added:
            return #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
}

class MovieDetailsController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelOriginalTitle: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var buttonFavorite: UIButton!
    
    
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
    
    @IBAction func didTapAdd(_ sender: UIButton) {
        presenter.didTapAddMovie()
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
    
    func display(state: FavoriteState) {
        buttonFavorite.setTitle(state.rawValue, for: .normal)
        buttonFavorite.setTitleColor(state.color, for: .normal)
        buttonFavorite.isUserInteractionEnabled = state == .canAdd
    }
}
