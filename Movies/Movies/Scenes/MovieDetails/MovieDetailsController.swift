//
//  MovieDetailsController.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit

class MovieDetailsController: UIViewController {
    
    var presenter: MovieDetailsController!
    
    static func storyBoardInstance() -> MovieDetailsController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MovieDetailsController") as! MovieDetailsController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
