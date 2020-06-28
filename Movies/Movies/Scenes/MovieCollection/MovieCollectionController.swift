//
//  ViewController.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit

class MovieCollectionController: UIViewController, MovieCollectionView {

    private let configurator = MovieCollectionConfiguratorImpl()
    var presenter: MovieCollectionPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configurator.configure(for: self)
        presenter.viewDidLoad()
    }
}

