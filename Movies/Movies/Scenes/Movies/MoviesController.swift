//
//  ViewController.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit

class MoviesController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    private let configurator = MoviesConfiguratorImpl()
    var presenter: MoviesPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configurator.configure(for: self)
        presenter.viewDidLoad()
        
        collectionView.register(UINib.init(
            nibName: AppConsts.UI.Cell.MovieCollection.id, bundle: nil),
            forCellWithReuseIdentifier: AppConsts.UI.Cell.MovieCollection.id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       addBarFilter()
    }
}

extension MoviesController: MoviesView {
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController.init(
            title: "Error",
            message: message,
            preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
}

extension MoviesController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
}

extension MoviesController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfMovies
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConsts.UI.Cell.MovieCollection.id, for: indexPath) as! MovieCollectionCell
        presenter.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
}

extension MoviesController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.height/3)
    }
}

