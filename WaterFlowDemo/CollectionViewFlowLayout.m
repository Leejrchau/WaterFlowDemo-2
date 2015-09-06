//
//  CollectionViewFlowLayout.m
//  WaterFlowDemo
//
//  Created by fuliang123 on 15/2/11.
//  Copyright (c) 2015年 lizhichao. All rights reserved.
//

#import "CollectionViewFlowLayout.h"

static CGFloat contentHeight = 0;
@implementation CollectionViewFlowLayout
//准备布局
-(void)prepareLayout
{
    [super prepareLayout];
    _cellHeightsArray = [NSMutableArray array];
    _cellFramesDictionary = [NSMutableDictionary dictionary];
    //获取cell的总个数
    self.cellCounts = [self.collectionView numberOfItemsInSection:0];
    if(self.cellCounts == 0){
        return;
    }
    
}

-(CGSize )collectionViewContentSize
{
    return  CGSizeMake(self.collectionView.bounds.size.width, contentHeight);
}

// collectionView在给你
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize itemSize =  [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath ];
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    UIEdgeInsets insets = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.item];
    
    if(indexPath.item>2){
        
        CGRect rect = [[_cellFramesDictionary objectForKey:[NSString stringWithFormat:@"%ld",indexPath.item%3]]CGRectValue];
        attributes.frame = CGRectMake(rect.origin.x, rect.origin.y+rect.size.height+2, itemSize.width, itemSize.height);
    }else{
        attributes.frame = CGRectMake((indexPath.item%3)*(itemSize.width+insets.left), (indexPath.row/3)*itemSize.height+insets.top, itemSize.width, itemSize.height);
    }
    
    [_cellFramesDictionary setObject:[NSValue valueWithCGRect:attributes.frame] forKey:[NSString stringWithFormat:@"%ld",indexPath.item%3]];
    CGFloat height = attributes.frame.origin.y+attributes.frame.size.height;
    if(height > contentHeight){
        contentHeight = height;
    }
    return attributes;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* array = [NSMutableArray array];
    for(int i = 0;i<self.cellCounts;i++){
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [array addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return array;
}

@end
