//
//  BikeShareLocations.m
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-05.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "BikeShareLocationsManager.h"


@implementation BikeShareLocationsManager
{
  
  NSArray *test;
  NSMutableArray *stations;
}

- (instancetype)init
{
  self = [super init];
  if (self)
  {
    self.http = [[HTTPCommunication alloc] init];
  }
  return self;
}
- (void)listOfLocationsSucess:(void (^)(NSArray *results))sucess
{
  
    //Retrieve the Jokes using the HTTP Communication
  NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
  [self.http retreiveURL:url sucessBlock:^(NSData *response) {
    NSError *error = nil;
    
    //De-serialize the information from the API
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
    NSLog(@"%@", data);
    
    NSArray *results = [data valueForKey:@"stationBeanList"];
    stations = [[NSMutableArray alloc]init];
    if(!error){
      
      for (NSDictionary *resultsDictionary in results) {
        [stations addObject:[resultsDictionary objectForKey:@"stationName"]];
        //      [teamsId addObject: [resultsDictionary objectForKey:@"id"]];
      }
      sucess(stations);
      NSLog(@"%@", stations);
    }
    //stations = data;
//    if(!error) {
//      NSDictionary *value = data[@"id"];
//      NSLog(@"%@", value);
//    }
  }];
}

@end
