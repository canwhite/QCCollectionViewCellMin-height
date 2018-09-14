//
//  SecondMarketBuyAndSellCollectionViewCell.h
//  QCBaseProjectForTest
//
//  Created by EricZhang on 2018/9/13.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondMarketBuyAndSellCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UILabel *timelabel;
@property(nonatomic,strong) UILabel *contentLabel;


@property(nonatomic,strong) NSMutableArray * imageArr;
@property(nonatomic,strong) UIView *imgView;
@end
