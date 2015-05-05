//
//  BikeShareLocation.m
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-05.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "BikeShareLocation.h"
#import "BikeShareLocationsManager.h"

@implementation BikeShareLocation


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
  self = [super init];
  if (self) {
    self.title = dictionary[@"latitude"];
    
  }
  return self;
}
@end
