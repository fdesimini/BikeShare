//
//  BikeShareLocations.m
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-05.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "BikeShareLocationsManager.h"
#import "BikeShareLocation.h"

@implementation BikeShareLocationsManager

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
    
    if(!error){
      NSArray *results = [data valueForKey:@"stationBeanList"];
      NSMutableArray *stationsData = [[NSMutableArray alloc]init];

      for (NSDictionary *resultsDictionary in results) {
        [stationsData addObject:[resultsDictionary objectForKey:@"stationName"]];
        BikeShareLocation *bikeStation = [[BikeShareLocation alloc] initWithDictionary:resultsDictionary];
        [stationsData addObject:bikeStation];
      }
      
      sucess(stationsData);
      NSLog(@"%@", stationsData);
    }
  }];
}

@end
