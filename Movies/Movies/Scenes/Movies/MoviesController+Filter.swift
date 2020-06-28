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
        let sheet = UIAlertController.init(
                title: AppConsts.Filter.title,
                message: AppConsts.Filter.message,
                preferredStyle: .actionSheet)
        sheet.addAction(
            UIAlertAction.init(
                title: AppConsts.AlertAction.popular,
                style: .default, handler: { [weak self] (action) in
                    self?.presenter.didTapFilter(type: .popular)
        }))
        sheet.addAction(UIAlertAction.init(
            title: AppConsts.AlertAction.topRated,
            style: .default, handler: { [weak self] (action) in
                    self?.presenter.didTapFilter(type: .topRated)
        }))
        sheet.addAction(UIAlertAction.init(
            title: AppConsts.AlertAction.favorite,
            style: .default, handler: { (action) in
                self.presenter.didTapFilter(type: .favorite)
        }))
        
        sheet.addAction(UIAlertAction.init(
            title: AppConsts.AlertAction.cancel,
            style: .cancel, handler: nil))
        self.present(sheet, animated: true, completion:  nil)
    }
}
