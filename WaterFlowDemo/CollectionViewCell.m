//
//  CollectionViewCell.m
//  WaterFlowDemo
//
//  Created by fuliang123 on 15/2/11.
//  Copyright (c) 2015年 lizhichao. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell


-(void)setImage:(UIImage *)image
{
    if(_image!=image){
        _image = image;
        self.contentView.layer.contents = (__bridge id)image.CGImage;
    }
    [self setNeedsDisplay];
}


@end
