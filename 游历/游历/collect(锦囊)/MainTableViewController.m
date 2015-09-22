

#import "MainTableViewController.h"
#import "CollectionViewCell.h"
#import "RecipeCollectionHeaderView.h"
#import "collectModel.h"
#import "XLPlainFlowLayout.h"
#import "BagViewController.h"
@interface MainTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *collectionView1;
    UICollectionViewFlowLayout *layout;
    NSMutableArray *dataBigArr;
    NSMutableArray *dataArr;
    
}



@property(nonatomic,strong)NSMutableArray * arrs;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    XLPlainFlowLayout *layout1 = [XLPlainFlowLayout new];
    layout1.itemSize = CGSizeMake(0, 0);
    layout1.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout1.naviHeight = 0;
    
    
    collectionView1 = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDHT, SCREEN_HEIGHT -104-49) collectionViewLayout:layout1];
    
 
    collectionView1.showsHorizontalScrollIndicator = NO;
    collectionView1.showsVerticalScrollIndicator = NO;
    collectionView1.delegate = self;
    collectionView1.dataSource = self;
    collectionView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView1];
//    注册
//    [collectionView1 registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"1234"];
    
    
     [collectionView1 registerClass:[RecipeCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"456"];
    [self downData];
   
//    NSArray * arr = @[@"1",@"2",@"11",@"4",@"5",@"8",@"10",@"12"];
    NSLog(@"%ld",self.index);
   }

-(void)downData
{
    [DownLoadData getCountriesDetailData:^(id obj, id obj1, NSError *err) {
        if (obj) {
            
            dataBigArr = obj;
            dataArr = dataBigArr[_index];
            [collectionView1 reloadData];
            
        }else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"数据下载失败" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            alert = nil;
        }
        
    } withId:nil];
    
    
}


#pragma mark -- 定义section个数

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma  mark -- 返回collectionCell个数
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"1234" forIndexPath:indexPath];
    
    

    
    // Register nib file for the cell
    UINib *nib = [UINib nibWithNibName:@"CollectionViewCell"
                                bundle: [NSBundle mainBundle]];
  
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"1234"];
//    CollectionViewCell *cell = [[CollectionViewCell alloc]init];
    
    // Set up the reuse identifier
   CollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"1234"
                                                     forIndexPath:indexPath];
    

    
    //        圆角效果
    cell.layer.cornerRadius = 8.0;
    cell.layer.masksToBounds = YES;
    
    collectModel *model = dataArr[indexPath.row];
    
    cell.myLable.text = model.catename;
    
    NSString *path = model.photo;
    NSURL *url = [NSURL URLWithString:path];
    
    [cell.myImage sd_setImageWithURL:url];
    
    
    
    
    
    return cell;
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataArr.count;
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

/*
#if 0
#pragma mark -- 表头大小 ============
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={0,0};
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
#endif
*/

#pragma mark -- UICollectionViewDelegate
//点击时间
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    collectModel *model = dataArr[indexPath.row];
    BagViewController *bagView = [[BagViewController alloc]init];
    int n = model.pid;
    bagView.myId = [NSString stringWithFormat:@"%d",n];
    
    [self.navigationController pushViewController:bagView animated:YES];
    
    
    
}

@end
