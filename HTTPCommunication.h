//
//  HTTPCommunication.h
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-05.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPCommunication : NSObject <NSURLSessionDownloadDelegate>

//Block we will call with sucessful request
@property (copy, nonatomic) void  (^sucessBlock)(NSData *);

//request using NSURLRequest and NSURLConnection
- (void)retreiveURL:(NSURL *)url sucessBlock:(void (^)(NSData *))sucessBlock;

//finish downloading the delegate method
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location;



@end
