//
//  RNTMapManager.m
//  reacttest
//
//  Created by genilex3 on 2017/8/2.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "RNTMapManager.h"
#import "RNTMap.h"
#import <React/UIView+React.h>
#import "RCTConvert+CoreLocation.h"

@implementation RNTMapManager

RCT_EXPORT_MODULE()

//*** 运行流程:7/10 下面这行定义onChangeInOC，这样才能使这个属性被外部可见，并可用。*/
RCT_EXPORT_VIEW_PROPERTY(onChangeInOC, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(pitchEnable, BOOL)

RCT_CUSTOM_VIEW_PROPERTY(region, MKCoordinateRegion, RNTMap) {
  [view setRegion:json ? [RCTConvert MKCoordinateRegion:json] : defaultView.region animated:YES];
}

- (UIView *)view
{
  RNTMap *map = [RNTMap new];
  map.delegate = self;
  return map;
  //  return [[MKMapView alloc] init];
  
  // UILabel *txtLabel = [[UILabel alloc] init];
  // txtLabel.backgroundColor = [UIColor blueColor];
  // txtLabel.frame = CGRectMake(100, 100, 200, 80);
  // txtLabel.text = @"Hello";
  // return txtLabel;
}

#pragma mark MKMapViewDelegate

- (void)mapView:(RNTMap *)mapView regionDidChangeAnimated:(BOOL)animated
{
  if (!mapView.onChangeInOC) {
    return;
  }
  
  MKCoordinateRegion region = mapView.region;
  //*** 运行流程:8/10 下面是在OC内部触发自定义的block，从而触发外部写入的block方法*/
  mapView.onChangeInOC(@{
                         @"region": @{
                             @"latitude": @(region.center.latitude),
                             @"longitude": @(region.center.longitude),
                             @"latitudeDelta": @(region.span.latitudeDelta),
                             @"longitudeDelta": @(region.span.longitudeDelta),
                             }
                         });
}

@end


