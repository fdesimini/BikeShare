//
//  Annotation.h
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-05.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Annotation : NSObject <CLLocationManagerDelegate>

@property (nonatomic) CLLocationCoordinate2D coord;


@end
