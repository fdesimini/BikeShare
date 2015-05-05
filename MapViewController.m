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
  

}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  if (annotation == mapView.userLocation) return nil;
  MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
  if (!view) {
    view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annoView"];
  }
  
  return view;
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
