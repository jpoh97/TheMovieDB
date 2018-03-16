//
//  UIListCollectionView.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class ListCollectionView : UICollectionView, List {
    //MARK: Properties
    weak var listDelegate : ListDelegate?
    fileprivate let cellIdentifier = "ListCollectionViewCell"
    fileprivate let cellsPerRow = 2
    fileprivate let cellHeight: CGFloat = 300
    fileprivate let bottomSpaceBetweenCells: CGFloat = 10
    fileprivate let leftPadding: CGFloat = 10
    fileprivate let rightPadding: CGFloat = 10
    fileprivate let topPadding: CGFloat = 10
    fileprivate let middleSpaceBetweenCells: CGFloat = 10
    
    init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func reloadAllData(){
        reloadData()
    }
}

private extension ListCollectionView {
    func configure() {
//        self.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        dataSource = self
        delegate = self
        configureFlowLayout()
    }
    
    func configureFlowLayout() {
        let viewFlowLayout = UICollectionViewFlowLayout()
        
        viewFlowLayout.minimumInteritemSpacing = middleSpaceBetweenCells
        viewFlowLayout.minimumLineSpacing = bottomSpaceBetweenCells
        viewFlowLayout.sectionInset = UIEdgeInsetsMake(topPadding, leftPadding, 0, rightPadding)
        viewFlowLayout.scrollDirection = .horizontal        
        backgroundColor = UIColor.clear
        collectionViewLayout = viewFlowLayout
    }
}

extension ListCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listDelegate?.numberOfCells() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath : IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        listDelegate?.configureCell(cell: cell as! ListCell, index: indexPath.row)
        return cell
    }
}

extension ListCollectionView : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        let blankSpaces = leftPadding + middleSpaceBetweenCells
        let width = collectionWidth / CGFloat(cellsPerRow) - blankSpaces
        return CGSize(width: width, height: cellHeight)
    }
}

