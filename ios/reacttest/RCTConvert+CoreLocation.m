//
//  RCTConvert+CoreLocation.m
//  reacttest
//
//  Created by genilex3 on 2017/8/2.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "RCTConvert+CoreLocation.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@implementation RCTConvert (CoreLocation)

RCT_CONVERT(CLLocationDegrees, CLLocationDegrees, doubleValue);
RCT_CONVERT(CLLocationDistance, CLLocationDistance, doubleValue);

+ (CLLocationCoordinate2D)CLLocationCoordinate2D:(id)json {
  json = [self NSDictionary:json];
  
  return (CLLocationCoordinate2D){
    [self CLLocationDegrees:json[@"latitude"]],
    [self CLLocationDegrees:json[@"longitude"]]
  };
}

+ (double)CLLocationDegrees:(NSString *)str {
  return str.doubleValue;
}

@end

@implementation RCTConvert(MapKit)

+ (MKCoordinateSpan)MKCoordinateSpan:(id)json
{
  json = [self NSDictionary:json];
  return (MKCoordinateSpan){
    [self CLLocationDegrees:json[@"latitudeDelta"]],
    [self CLLocationDegrees:json[@"longitudeDelta"]]
  };
}

+ (MKCoordinateRegion)MKCoordinateRegion:(id)json
{
  return (MKCoordinateRegion){
    [self CLLocationCoordinate2D:json],
    [self MKCoordinateSpan:json]
  };
}


@end
