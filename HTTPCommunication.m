//
//  HTTPCommunication.m
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-05.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "HTTPCommunication.h"

@implementation HTTPCommunication

- (void)retreiveURL:(NSURL *)url sucessBlock:(void (^)(NSData *))sucessBlock {
  
  self.sucessBlock = sucessBlock;
  
  //create the request object
  NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
  
  //set the session configuration
  NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
  
  //set up session
  NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
  
  //prepare the download task
  NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
  
  //Establish the Connection
  [task resume];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
  
  //Getting the download data from local storage
  NSData *data = [NSData dataWithContentsOfURL:location];
  
  //call sucess block from the main thread
  dispatch_async(dispatch_get_main_queue(), ^{
    //call data block
    self.sucessBlock(data);
  });
}

  




@end
