//
//  MoviesController+Filter.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit

extension MoviesController {
    
    func addBarFilter() {
        let item = UIBarButtonItem.init(
                title: AppConsts.Filter.title,
                style: .plain,
                target: self,
                action: #selector(didTapFilter))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func didTapFilter() {
        let vc = FilterController.storyBoardInstance(with: presenter.category)
            vc.delegate = self
        self.present(vc, animated: true, completion:  nil)
    }
}

extension MoviesController: FilterControllerDelegate {
    
    func filterControllerDidSelect(category: MovieCategory) {
        presenter.didTapFilter(cateogry: category)
    }
}
