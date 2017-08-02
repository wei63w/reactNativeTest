//
//  RCTConvert+CoreLocation.h
//  reacttest
//
//  Created by genilex3 on 2017/8/2.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <React/RCTConvert.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface RCTConvert (CoreLocation)

+ (CLLocationCoordinate2D)CLLocationCoordinate2D:(id)json;

@end

@interface RCTConvert(MapKit)

+ (MKCoordinateSpan)MKCoordinateSpan:(id)json;
+ (MKCoordinateRegion)MKCoordinateRegion:(id)json;

@end
