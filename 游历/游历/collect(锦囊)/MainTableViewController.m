

#import "MainTableViewController.h"
#import "CollectionViewCell.h"
#import "RecipeCollectionHeaderView.h"
@interface MainTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *collectionView1;
    UICollectionViewFlowLayout *layout;
}

@property(nonatomic,strong)NSMutableArray * arrs;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.minimumLineSpacing = 50;
//    layout.minimumInteritemSpacing =0;
    
    
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectionView1 = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDHT, SCREEN_HEIGHT-104 -49) collectionViewLayout:layout];
    
 
    collectionView1.showsHorizontalScrollIndicator = NO;
    collectionView1.showsVerticalScrollIndicator = NO;
    collectionView1.delegate = self;
    collectionView1.dataSource = self;
    collectionView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView1];
//    注册
    [collectionView1 registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"1234"];
    
    
     [collectionView1 registerClass:[RecipeCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"456"];
   
//    NSArray * arr = @[@"1",@"2",@"11",@"4",@"5",@"8",@"10",@"12"];
    NSLog(@"%ld",self.index);
   }
#pragma mark -- 定义section个数

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

#pragma  mark -- 返回collectionCell个数
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"1234" forIndexPath:indexPath];
    //        圆角效果
    cell.layer.cornerRadius = 8.0;
    cell.layer.masksToBounds = YES;
    cell.backgroundColor = [UIColor redColor];
    return cell;
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}



#pragma mark -- UICollectionViewDelegateFlowLayout


#pragma mark -- 返回每个collectionCell的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 130);
}



#pragma mark --表框效果
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}


#pragma mark -- 表头大小 ============
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={100,40};
    return size;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"456" forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor orangeColor];
        
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, 0,SCREEN_WIDHT, 40);
        
        label.backgroundColor = [UIColor redColor];
        
        if (indexPath.section == 0) {
            label.text = @"heeheheheheeh";
        }
        
        [headerView addSubview:label];
        
        return  headerView;
        
    }
    
    if (kind == UICollectionElementKindSectionFooter){
        
        
          RecipeCollectionHeaderView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"456" forIndexPath:indexPath];
        
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, 0, 100, 20);
        label.backgroundColor = [UIColor redColor];
        
        [footerview addSubview:label];
        
        return  footerview;
        
    }
    
    return reusableview;
    
    
    
}



#pragma mark -- UICollectionViewDelegate
//点击时间
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}

@end
