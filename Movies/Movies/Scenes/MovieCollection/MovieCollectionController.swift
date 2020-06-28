//
//  ViewController.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit

class MovieCollectionController: UIViewController, MoviesView {

    
    @IBOutlet weak var collectionView: UICollectionView!
    private let configurator = MovieCollectionConfiguratorImpl()
    var presenter: MovieCollectionPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configurator.configure(for: self)
        presenter.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(
            nibName: "MovieCollectionCell", bundle: nil),
            forCellWithReuseIdentifier: "MovieCollectionCell")
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}

extension MovieCollectionController: UICollectionViewDelegate {
    
}

extension MovieCollectionController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfMovies
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as! MovieCollectionCell
        presenter.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
}

extension MovieCollectionController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
    }
}

