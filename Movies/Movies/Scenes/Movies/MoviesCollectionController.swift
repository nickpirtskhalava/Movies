//
//  ViewController.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit

class MovieCollectionController: UIViewController, MoviesCollectionView {

    private let configurator = MoviesCollectionConfiguratorImpl()
    var presenter: MoviesCollectionPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

