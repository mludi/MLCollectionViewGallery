//
//  MLCollectionViewCell.swift
//  UICollectionViewGallery
//
//  Created by Matthias Ludwig on 10/05/16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

import UIKit

class MLCollectionViewCell: UICollectionViewCell {
    
    let theImageView: UIImageView
    
    override init(frame: CGRect) {
        
        theImageView = UIImageView()
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.contentMode = .ScaleToFill
        
        super.init(frame: frame)
        
        contentView.addSubview(theImageView)
        
        let views = ["theImageView": theImageView]
        
        var constraints = NSLayoutConstraint.constraintsWithVisualFormat("|[theImageView]|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|[theImageView]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
