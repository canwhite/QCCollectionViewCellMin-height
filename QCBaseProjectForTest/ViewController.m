//
//  ViewController.m
//  QCBaseProjectForTest
//
//  Created by EricZhang on 2018/9/8.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import "ViewController.h"
#import "SecondMarketBuyAndSellCollectionViewCell.h"
@interface ViewController ()< UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) NSMutableArray *imageArr ;
@property(nonatomic,strong) UICollectionView *collectionView;//
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(242, 242, 242, 1);
    self.title = @"测试";
    //初始化一下数据
    [self initData];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = RGBA(242, 242, 242, 1);
    
    
    
    
}

-(void)initData{
    NSMutableArray *arr1 = [NSMutableArray new];
    NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:@"touxiang",@"touxiang", nil];
    self.imageArr  = [NSMutableArray new];
    [self.imageArr addObject:arr1];
    [self.imageArr addObject:arr2];
    [self.imageArr addObject:arr1];
    [self.imageArr addObject:arr2];
    
    
}


-(UICollectionView *)collectionView{
    
    
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,64, CKScreenW, CKScreenH-64) collectionViewLayout:flowLayout];
        
        //定义每个UICollectionView zong向的间距
        flowLayout.minimumLineSpacing = 10;
        //定义每个UICollectionView heng向的间距
        flowLayout.minimumInteritemSpacing = 0;
        
        //注册cell
        NSArray *cellclassArr = @[[SecondMarketBuyAndSellCollectionViewCell class]];
        NSArray *reuseID = @[@"cell1"];
        
        for (int i = 0; i<reuseID.count; i++) {
            [_collectionView registerClass:cellclassArr[i] forCellWithReuseIdentifier:reuseID[i]];
        }
        
        //注册头部
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
        
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        
        //_collectionView.delaysContentTouches = NO;
        
        //背景颜色
        _collectionView.backgroundColor = [UIColor whiteColor];
        //自适应大小
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        
        
    }
    return _collectionView;
    
}
#pragma mark - dataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
    return  self.imageArr.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    static NSString  *identify = @"cell1";
    SecondMarketBuyAndSellCollectionViewCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell1.imageArr = self.imageArr[indexPath.row];
    
    
    return cell1;
    
    
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return  UIEdgeInsetsMake(0,0,0,0);
    
}
//这个设置每个item的形状大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray * arr = self.imageArr[indexPath.row];
    if (arr.count > 0) {
        return  CGSizeMake(CKScreenW, 195);
    }else{
        return  CGSizeMake(CKScreenW, 115);
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
