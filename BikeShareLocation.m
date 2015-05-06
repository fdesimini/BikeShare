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


//- (instancetype)initWithDictionary:(NSDictionary *)dictionary
//{
//  self = [super init];
//  if (self) {
//    self.title = dictionary[@"stationName"];
//    self.stationLongtitude = dictionary[@"longtitude"];
//    self.stationLatitude = dictionary[@"latitude"];
//    self.coordinate = CLLocationCoordinate2DMake([self.stationLatitude doubleValue], [self.stationLongtitude doubleValue]);
//  }
//  return self;
//}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForannotation:(id<MKAnnotation>)annotation
{
  MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
  
  if(!view) {
    view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annoView"];
  }
  return view;
}


@end
