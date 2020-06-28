//
//  ViewController.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit

class MovieCollectionController: UIViewController, MovieCollectionView {

    
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
}

extension MovieCollectionController: UICollectionViewDelegate {
    
}

extension MovieCollectionController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath)
    }
}

extension MovieCollectionController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
    }
}

