//
//  BikeShareLocations.h
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-05.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPCommunication.h"
#import "BikeShareLocation.h"


@interface BikeShareLocationsManager : HTTPCommunication


@property (strong, nonatomic) HTTPCommunication *http;
@property (strong, nonatomic) BikeShareLocation *station;
//@property (strong, nonatomic) NSDictionary *dictionary;

- (void)listOfLocationsSucess:(void (^)(NSArray *results))sucess;

@end
