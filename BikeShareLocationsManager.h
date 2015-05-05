//
//  BikeShareLocations.h
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-05.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPCommunication.h"

@interface BikeShareLocationsManager : NSObject


@property (strong, nonatomic) HTTPCommunication *http;
//@property (strong, nonatomic) NSDictionary *dictionary;

- (void)listOfLocationsSucess:(void (^)(NSArray *results))sucess;

@end
