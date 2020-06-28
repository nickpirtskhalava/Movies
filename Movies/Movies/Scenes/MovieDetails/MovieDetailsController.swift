//
//  MovieDetailsController.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit

class MovieDetailsController: UIViewController {
    
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
    }
}


extension MovieDetailsController: MovieDetailsView {
    
    
}
