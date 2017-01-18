//
//  ImageCollectionViewCell.m
//  ImageScroller
//
//  Created by Matthias Ludwig on 17.01.17.
//  Copyright © 2017 Matthias Ludwig. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        
        [self addSubview:self.imageView];
    }
    return self;
}

@end
