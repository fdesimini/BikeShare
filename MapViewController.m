//
//  MapViewController.m
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-04.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()


@end

@implementation MapViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.tabBarItem.title = @"Maps";
    self.tabBarItem.image = [UIImage imageNamed:@"Map"];
    self.view.backgroundColor = [UIColor blueColor];

  }
  return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    //Initialize the MapView Object to the size of the screen
    self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.mapView];
  
  self.mapView.delegate = self;
  self.locationManager = [[CLLocationManager alloc]init];
  if (IS_OS_8_OR_LATER) {
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
  }
  [self.locationManager startUpdatingLocation];
  self.mapView.showsUserLocation = YES;
  self.mapView.showsPointsOfInterest = YES;
  
  //set the latitude and longtitude
  double lat = 43.642566;
  double lng = -79.387057;
  
  //Structure that creates a geographical coordinate
  CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lng);
  
  /* MKPlacemark object stores placemark data for a given long/lat Placemark data
   includes information such as the country, state, city, and street address
   associated with the specified coordinate. You can initialize a placemark using
   the initWithPlacemark: inherited method or the
   initWithCoordinate:addressDictionary: method specifying a coordinate and address
   dictionary. */
  
  MKPlacemark *placemark  = [[MKPlacemark alloc]initWithCoordinate:coord
                                                 addressDictionary:nil];
  MKMapItem *mapItem = [[MKMapItem alloc]initWithPlacemark:placemark];
  
  //display the map
  [mapItem openInMapsWithLaunchOptions:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
