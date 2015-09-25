//
//  SmallMapCell.m
//  游历
//
//  Created by MAC—IOS on 15/9/24.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "SmallMapCell.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#define KEY @"015623c8890070db1f63fc6345aa8e59"

#define kDefaultControlMargin           22
#define kDefaultLocationZoomLevel       18.1
@interface SmallMapCell ()<MAMapViewDelegate, AMapSearchDelegate>
{
    MAMapView * mapView;
    UIButton *_locationButton;
    
    NSMutableArray *_annotations;
    CLLocation *_currentLocation;
    AMapSearchAPI *_search;
    
    AMapPOISearchResponse *respones;
    
    UITableView *_tableView;
    NSArray *_pois;
    
    UITapGestureRecognizer *_longPressGesture;
    
    MAPointAnnotation *_destinationPoint;
    NSArray *_pathPolylines;
}
@end
@implementation SmallMapCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
         [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveNotification:) name:@"indexPath" object:nil];
         [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(idStrNotification:) name:@"idStr" object:nil];
        
        
        
        UIView *superView = self.contentView;
        
        [MAMapServices sharedServices].apiKey = KEY;
        [AMapSearchServices sharedServices].apiKey = KEY;
        
        
        mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(superView.bounds), CGRectGetHeight(superView.bounds))];
        
        mapView.delegate = self;
        mapView.compassOrigin = CGPointMake(mapView.compassOrigin.x, 1);
        mapView.scaleOrigin = CGPointMake(mapView.scaleOrigin.x, 1);
        mapView.showsUserLocation = YES;
        [superView addSubview:mapView];


        
//        点击定位
        [self initControls];
        [self locateAction];

        
//        搜索
        [self initSearch];
     

    }
    return self;
}

#pragma mark - ActionUI
-(void)initControls
{
    
    _locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _locationButton.frame = CGRectMake(kDefaultControlMargin, CGRectGetHeight(mapView.bounds) - 80, 40, 40);
    _locationButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    _locationButton.backgroundColor = [UIColor whiteColor];
    
    [_locationButton addTarget:self action:@selector(locateAction) forControlEvents:UIControlEventTouchUpInside];
    
    [_locationButton setImage:[UIImage imageNamed:@"location_no"] forState:UIControlStateNormal];
    
    [mapView addSubview:_locationButton];
    
    
    //    搜索按钮
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchButton.frame = CGRectMake(80, CGRectGetHeight(mapView.bounds) - 80, 40, 40);
    searchButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    searchButton.backgroundColor = [UIColor whiteColor];
    [searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    
    [searchButton addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    
    [mapView addSubview:searchButton];
    
}

#pragma mark - Action
- (void)initSearch
{
    _search = [[AMapSearchAPI alloc]init];
    
    _search.delegate = self;
    
}
//定位范围
-(void)locateAction
{
    
    if (mapView.userTrackingMode != MAUserTrackingModeFollow)
    {
        mapView.userTrackingMode = MAUserTrackingModeFollow;
        [mapView setZoomLevel:kDefaultLocationZoomLevel animated:YES];
    }
}

//搜索事件
-(void)searchAction
{
    
    
    if (_currentLocation == nil || _search == nil)
    {
        NSLog(@"search failed");
        return;
    }
    
    AMapPOIAroundSearchRequest *request = [[AMapPOIAroundSearchRequest alloc] init];
    //    request.searchType =  AMapNearbySearchTypeLiner;
    //    request.searchType = AMapSearchType_PlaceAround;
    
    request.location = [AMapGeoPoint locationWithLatitude:_currentLocation.coordinate.latitude longitude:_currentLocation.coordinate.longitude];
    NSLog(@"%@",request.location);
    
    request.keywords = @"餐饮";
    
    [_search AMapPOIAroundSearch:request];
    
}
//搜索请求
- (void)reGeoAction
{
    if (_currentLocation)
    {
        AMapReGeocodeSearchRequest *request = [[AMapReGeocodeSearchRequest alloc] init];

        request.location = [AMapGeoPoint locationWithLatitude:_currentLocation.coordinate.latitude longitude:_currentLocation.coordinate.longitude];
        
        
        [_search AMapReGoecodeSearch:request];
    }
}

-(void)receiveNotification:(NSNotification *)notif

{
    
    // 参数的类型是固定的 NSNotification*
    
    // 可以通过参数 获取消息携带的内容
    
    NSIndexPath *indexPath = [notif object];
    
    // 为点击的poi点添加标注
    AMapPOI *poi = _pois[indexPath.row];
    
    MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(poi.location.latitude, poi.location.longitude);
    annotation.title = poi.name;
    annotation.subtitle = poi.address;
    
    [mapView addAnnotation:annotation];
    
    [_annotations addObject:annotation];
    

    
}
//搜索通知
-(void)idStrNotification:(NSNotification *)notif
{
    
    NSString *idStr = [notif object];
    if ([idStr isEqualToString:@"展开地图"]) {
        return;
    }
    
    if (_currentLocation == nil || _search == nil)
    {
        NSLog(@"search failed");
        return;
    }
    
    AMapPOIAroundSearchRequest *request = [[AMapPOIAroundSearchRequest alloc] init];
    request.location = [AMapGeoPoint locationWithLatitude:_currentLocation.coordinate.latitude longitude:_currentLocation.coordinate.longitude];
    NSLog(@"%@",request.location);
    
    if ([idStr isEqualToString:@"搜索周边"]) {
        idStr = @"美食|宾馆|理发|超市";
    }
    
    request.keywords = idStr;
    
    [_search AMapPOIAroundSearch:request];
    

    
}


#pragma mark - SearchDelegate
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    NSLog(@"request: %@", request);
    NSLog(@"response: %@", response);
    
    if (response.pois.count > 0)
    {
        _pois = response.pois;
        
        self.blok(_pois);
//        [_tableView reloadData];
        
        
        // 清空标注
        [mapView removeAnnotations:_annotations];
        [_annotations removeAllObjects];
        
    }
}

- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"地图加载失败请检查网络" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    alert = nil;
    NSLog(@"%@",error);

}




- (void)searchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"request :%@, error :%@", request, error);
}

#pragma mark 逆地理编码
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    NSLog(@"response :%@", response);
    
    NSString *title = response.regeocode.addressComponent.city;
    if (title.length == 0)
    {
        // 直辖市的city为空，取province
        title = response.regeocode.addressComponent.province;
    }
    
    // 更新我的位置title
    mapView.userLocation.title = title;
    mapView.userLocation.subtitle = response.regeocode.formattedAddress;
    NSLog(@"%@",response.regeocode.formattedAddress);
}
- (void)onNearbySearchDone:(AMapNearbySearchRequest *)request response:(AMapNearbySearchResponse *)response
{
    
    
}


- (void)awakeFromNib {
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - mapView
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    NSLog(@"userLocation: %@", userLocation.location);
    _currentLocation = [userLocation.location copy];
    
//   调用请求逆地理编码
//    [self reGeoAction];
    
}

//当didChangeUserTrackingMode  改变是调用的方法  修改按钮图片
- (void)mapView:(MAMapView *)mapView didChangeUserTrackingMode:(MAUserTrackingMode)mode animated:(BOOL)animated
{
    // 修改定位按钮状态
    if (mode == MAUserTrackingModeNone)
    {
        [_locationButton setImage:[UIImage imageNamed:@"location_no"] forState:UIControlStateNormal];
    }
    else
    {
        [_locationButton setImage:[UIImage imageNamed:@"location_yes"] forState:UIControlStateNormal];
    }

}

#pragma mark  didSelectAnnotation

- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view
{
    // 选中定位annotation的时候进行逆地理编码查询
    if ([view.annotation isKindOfClass:[MAUserLocation class]])
    {
        [self reGeoAction];
    }
}

#pragma mark - MAMapViewDelegate


- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
        annotationView.canShowCallout = YES;
        
        return annotationView;
    }
    
    return nil;
}



@end
