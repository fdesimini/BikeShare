//
//  MapViewController.m
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-04.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "MapViewController.h"
#import "CustomAnnotationView.h"
#import "MoreInfoViewController.h"

@interface MapViewController ()


@end

@implementation MapViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.navigationItem.title = @"Bike Share Map";
    self.tabBarItem.title = @"Maps";
    //UIImage *image = [UIImage imageNamed:@"pika"];
    //self.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.image = [UIImage imageNamed:@"Map"];
    self.view.backgroundColor = [UIColor blueColor];
    self.mapView.delegate = self;

  }
  return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
  NSMutableArray *test1 = [[NSMutableArray alloc]init];
  
  NSLog(@"%@", test1);
  
  self.bikeShareLocations = [[BikeShareLocationsManager alloc] init];
  
  // Do any additional setup after loading the view.
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  if(IS_OS_8_OR_LATER) {
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
  }
  [self.locationManager startUpdatingLocation];
  
  self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
  self.mapView.delegate = self;
  self.mapView.showsUserLocation = YES;
  self.mapView.showsPointsOfInterest = YES;
    //Initialize the MapView Object to the size of the screen
  [self.view addSubview:self.mapView];
  
//  // set longitude and longitude
//  double lat = 43.642566;
//  double lng = -79.387057;
//  //A structure that contains a geographical coordinate using the WGS 84 reference frame.
//  
//  CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat,lng);
//  
//  //     A MKPlacemark object stores placemark data for a given latitude and longitude. Placemark data includes information such as the country, state, city, and //street address associated with the specified coordinate. You can initialize a placemark using the initWithPlacemark: inherited method or the //initWithCoordinate:addressDictionary: method specifying a coordinate and address dictionary.
//  
//  MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coord
//                                                 addressDictionary:nil];
//  //A MKPlacemark object stores placemark data for a given latitude and longitude. Placemark data includes information such as the country, state, city, and //street address associated with the specified coordinate.
//  MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
//  // display the map
//  [mapItem openInMapsWithLaunchOptions:nil];
  
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self.bikeShareLocations listOfLocationsSucess:^(NSArray *results) {
    // put annotation here!
    //Where the magic happens
    for (BikeShareLocation *location in results) {
    
      [self.mapView addAnnotation:location];
    }
  }];
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
  
  MoreInfoViewController *moreInfoVC = [[MoreInfoViewController alloc]init];
  [self.navigationController pushViewController:moreInfoVC animated:YES];
  NSLog(@"Button Pressed");
  
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  
  MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];

  if ([annotation isKindOfClass:[BikeShareLocation class]]) {
  
    view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annoView"];
  }
  
  view.image = [UIImage imageNamed:@"bstoronto"];
  view.frame = CGRectMake(0, 0, 50 , 35);
  view.canShowCallout = YES;
  
  UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
  [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
  view.rightCalloutAccessoryView = rightButton;
  
  UIImageView *bikeShareImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"biking"]];
  view.leftCalloutAccessoryView = bikeShareImage;
  return view;
}




//Zooms into current location
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
  MKAnnotationView *annotationView = [views objectAtIndex:0];
  id<MKAnnotation> mp = [annotationView annotation];

  if (mp == mv.userLocation) {
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate] ,700 , 700);
  [mv setRegion:region animated:YES];
  }
}


- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
  self.mapView.showsUserLocation = YES;
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
