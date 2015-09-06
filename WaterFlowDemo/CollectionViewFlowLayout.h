//
//  CollectionViewFlowLayout.h
//  WaterFlowDemo
//
//  Created by fuliang123 on 15/2/11.
//  Copyright (c) 2015年 lizhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewFlowLayout : UICollectionViewFlowLayout

@property(nonatomic,assign)id<UICollectionViewDelegateFlowLayout>delegate;
@property(nonatomic,assign)NSInteger cellCounts;//存放cell的个数
@property(nonatomic,strong)NSMutableArray *cellHeightsArray;//存放每个cell的Height
@property(nonatomic,strong)NSMutableDictionary *cellFramesDictionary;//存放cell的位置信息




@end
