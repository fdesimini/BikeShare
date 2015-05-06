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
  NSMutableArray *stationData;
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
    //NSLog(@"%@", data);
    //self.station = [[BikeShareLocation alloc]init];
    
    if(!error){
      NSArray *results = [data valueForKey:@"stationBeanList"];
      //NSLog(@"%@", results);
    
      stationData = [[NSMutableArray alloc]init];
      for (NSDictionary *resultsDictionary in results) {
        BikeShareLocation *station = [[BikeShareLocation alloc] init];
        station.stationName = [resultsDictionary objectForKey:@"stationName"];
        station.stationAvailableBikes = [resultsDictionary objectForKey:@"availableBikes"];
        station.stationAvailableDocks = [resultsDictionary objectForKey:@"availableDocks"];
        station.stationID = [resultsDictionary objectForKey:@"id"];
        station.stationLatitude = [resultsDictionary objectForKey:@"latitude"];
        station.stationLongtitude = [resultsDictionary objectForKey:@"longitude"];
        station.coordinate = CLLocationCoordinate2DMake([station.stationLatitude doubleValue], [station.stationLongtitude doubleValue]);
        [stationData addObject:station];
        
//        NSLog(@"%@",self.station.stationName);
//        NSLog(@"%@",self.station.stationAvailableBikes);
//        BikeShareLocation *bikeStation = [[BikeShareLocation alloc] initWithDictionary:resultsDictionary];
        //[stationData addObject:bikeStation];
      }
      
      sucess(stationData);
      NSLog(@"%@", stationData);
    }
  }];
}

@end
