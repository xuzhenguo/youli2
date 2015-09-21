//
//  DownData.h
//  游历
//
//  Created by MAC—IOS on 15/9/21.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "downModel.h"
@class DownData;
typedef void (^didReceiveDataBlock)(DownData *fd);
typedef void (^downloadFinishedBlock)(DownData *fd);
typedef void (^downloadFailedBlock)(DownData *fd);
@interface DownData : NSObject<NSURLConnectionDataDelegate>
{
        NSURLConnection *_urlConnection;
        NSFileHandle *_fileHandle;
}
@property (nonatomic,strong)downModel *model;

- (void)requestFromUrlreceiveDataBlock:(didReceiveDataBlock)receiveDataBlock finished:(downloadFinishedBlock)finishedBlock failed:(downloadFailedBlock)failedBlock;
- (void)suspendDownload;
-(NSString *)localPath;
@end
