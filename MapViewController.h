//
//  MapViewController.h
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-04.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property BOOL userLocationUpdated;

//- (void)requestWhenInUseAuthorization;
//- (void)requestAlwaysAuthorization;

@end
