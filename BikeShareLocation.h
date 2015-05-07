//
//  BikeShareLocation.h
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-05.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
 


@interface BikeShareLocation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
//@property (nonatomic, readwrite) MKPointAnnotation *test;


@property (strong, nonatomic) NSString *stationName;
@property (strong, nonatomic) NSNumber *stationID;
@property (strong, nonatomic) NSNumber *stationAvailableDocks;
@property (strong, nonatomic) NSNumber *stationTotalDocks;
@property (strong, nonatomic) NSNumber *stationLatitude;
@property (strong, nonatomic) NSNumber *stationLongtitude;
@property (strong, nonatomic) NSNumber *stationAvailableBikes;
@property (strong, nonatomic) NSNumber *stationLandmark;

//-(instancetype)initWithDictionary:(NSDictionary *)dictionary;



@end
