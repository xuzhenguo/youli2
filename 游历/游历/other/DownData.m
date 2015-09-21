//
//  DownData.m
//  游历
//
//  Created by MAC—IOS on 15/9/21.
//  Copyright (c) 2015年 fuhua. All rights reserved.
//

#import "DownData.h"
#import "NSString+Hashing.h"
@implementation DownData
{
    didReceiveDataBlock _receiveDataBlock;
    downloadFinishedBlock _finishedBlock;
    downloadFailedBlock _failedBlock;
}
- (void)requestFromUrlreceiveDataBlock:(didReceiveDataBlock)receiveDataBlock finished:(downloadFinishedBlock)finishedBlock failed:(downloadFailedBlock)failedBlock{
    
    
    if (_receiveDataBlock != receiveDataBlock) {
        _receiveDataBlock = nil;
        _receiveDataBlock = receiveDataBlock;
    }
    if (_finishedBlock != finishedBlock) {
        _finishedBlock = nil;
        _finishedBlock = finishedBlock;
    }
    if (_failedBlock != failedBlock) {
        _failedBlock  = nil;
        _failedBlock = failedBlock;
    }
    NSURL *url = [NSURL URLWithString:self.model.file];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    _urlConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [_urlConnection start];
}
//关闭
- (void)suspendDownload{
    if (_fileHandle) {
        [_fileHandle closeFile];
        _fileHandle = nil;
    }
    [_urlConnection cancel];
    _urlConnection = nil;
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (_fileHandle) {
        [_fileHandle closeFile];
    }
    
    NSFileManager *fm = [NSFileManager defaultManager];
    //
    if (![fm fileExistsAtPath:self.localPath]) {
        NSLog(@"%@",self.localPath);
        [fm createFileAtPath:self.localPath contents:nil attributes:nil];
    }
    _fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:self.localPath];
    [_fileHandle seekToEndOfFile];
    self.model.downloadSize = [NSNumber numberWithLongLong:[_fileHandle offsetInFile]];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_fileHandle writeData:data];
    unsigned long long downloadSize = [self.model.downloadSize longLongValue]+[data length];
    self.model.downloadSize = [NSNumber numberWithLongLong:downloadSize];
     NSLog(@"已下载大小:%lld",downloadSize);
    if (_receiveDataBlock) {
        _receiveDataBlock(self);
    }

}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if (_fileHandle) {
        [_fileHandle closeFile];
        _fileHandle = nil;
    }
    if (_finishedBlock) {
        _finishedBlock(self);
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    if (_fileHandle) {
        [_fileHandle closeFile];
        _fileHandle = nil;
    }
    if (_failedBlock) {
        _failedBlock(self);
    }
}

-(NSString *)localPath{
    NSString *path = NSHomeDirectory();
    NSString *fileName = [self.model.file MD5Hash];
    path = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/%@",fileName]];
    return path;
}


@end
