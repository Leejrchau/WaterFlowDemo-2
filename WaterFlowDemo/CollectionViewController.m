//
//  CollectionViewController.m
//  WaterFlowDemo
//
//  Created by fuliang123 on 15/2/11.
//  Copyright (c) 2015年 lizhichao. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "CollectionViewFlowLayout.h"

#define cellCounts 17
#define lie 3
#define cellWidth  [[UIScreen mainScreen]bounds].size.width/lie

@interface CollectionViewController ()

@property(nonatomic,strong)NSMutableArray *collectionViewDataArray;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [(CollectionViewFlowLayout *)self.collectionViewLayout setDelegate:self];
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)collectionViewDataArray
{
    if(!_collectionViewDataArray){
        NSMutableArray *imagesArray = [NSMutableArray array];
        for(int i = 1;i< cellCounts;i++){
            
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"huoying%d",i]];
            [imagesArray addObject:image];
        }
        
        _collectionViewDataArray = imagesArray;
    }
    return _collectionViewDataArray;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionViewDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.image = [_collectionViewDataArray objectAtIndex:indexPath.item];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}


// 当collectionView开始创建cell的时候 会回调这个方法 获取对应indexPath的cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [_collectionViewDataArray objectAtIndex:indexPath.item];
    CGFloat cellNewHeight = [self getCellNewHeightWithOriginalSize:image.size];
    float height = (float)cellNewHeight;
    return CGSizeMake(cellWidth, floorf(height));
}

//这个方法返回的是每个cell彼此之间的竖直间距，也就是 行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

//这个方法返回的是每个cell彼此之间的水平间距，也就是 列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

// 这个方法 返回的是 collectionView中的内容 分别距离collectionView上 ，下，左，右，四个边的距离。（注意不是，每个cell之间的距离，而是collectionView的内容）
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets = UIEdgeInsetsMake(5, 2, 2, 2);
    return insets;
}
#pragma mark 计算经过缩放后cell的大小
-(CGFloat)getCellNewHeightWithOriginalSize:(CGSize)originalSize
{
    /* 算法：original高度／original宽度 ＝ new高度／new宽度 */
    return  originalSize.height/originalSize.width*cellWidth;
}


#pragma mark <UICollectionViewDelegate>

// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
