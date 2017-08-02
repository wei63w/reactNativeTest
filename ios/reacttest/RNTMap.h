//
//  RNTMap.h
//  reacttest
//
//  Created by genilex3 on 2017/8/2.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <React/RCTComponent.h>


@interface RNTMap : MKMapView

@property (nonatomic, copy) RCTBubblingEventBlock onChangeInOC;


@end
