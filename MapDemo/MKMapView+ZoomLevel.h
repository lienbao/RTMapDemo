//
//  MKMapView+ZoomLevel.h
//  MapDemo
//
//  Created by casa on 13-12-11.
//  Copyright (c) 2013年 casa. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (ZoomLevel)

@property (nonatomic, assign) NSUInteger zoomLevel;

- (void)setZoomLevel:(NSUInteger)zoomLevel
            animated:(BOOL)animated;

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;
@end
