//
//  CustomAnnotationView.m
//  BMBikeShareApplication
//
//  Created by Kunwardeep Gill on 2015-05-07.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "CustomAnnotationView.h"

@implementation CustomAnnotationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
  
  if (self) {
    self.image = [UIImage imageNamed:@"Pin"];
    self.canShowCallout = YES;
  }
  return self;
}
@end
