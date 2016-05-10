//
//  ViewController.swift
//  MLCollectionViewGallery
//
//  Created by Matthias Ludwig on 10/05/16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

import UIKit

class ImagesViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    private var pageControl: UIPageControl?
    
    private var images = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        
        for i in 1...6 {
            guard let image = UIImage(named: "\(i).jpg") else { continue }
            images.append(image)
        }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        guard let collectionView = collectionView else { fatalError("we need a collection view!") }
        collectionView.backgroundColor = .whiteColor()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.pagingEnabled = true
        collectionView.registerClass(MLCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.showsHorizontalScrollIndicator = false
        
        pageControl = UIPageControl()
        guard let pageControl = pageControl else { fatalError("we need a pageControl") }
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.tintColor = UIColor.blueColor()
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGrayColor()
        pageControl.currentPageIndicatorTintColor = .blackColor()
        
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
        let views = ["collectionView": collectionView, "pageControl": pageControl]
        
        var constraints = NSLayoutConstraint.constraintsWithVisualFormat("|[collectionView]|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|[collectionView]-[pageControl]-|", options: [.AlignAllLeading, .AlignAllTrailing], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(constraints)
        
        
        
    }
    
}

extension ImagesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as? MLCollectionViewCell else { return UICollectionViewCell() }
        cell.theImageView.image = images[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        guard let collectionView = collectionView else { fatalError("we need a collection view!") }
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: CGRectGetMidX(visibleRect), y: CGRectGetMidY(visibleRect))
        if let visibleIndexPath = collectionView.indexPathForItemAtPoint(visiblePoint) {
            pageControl?.currentPage = visibleIndexPath.row
        }
        
        
    }
    
}
