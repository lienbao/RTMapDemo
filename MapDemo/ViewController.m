//
//  ViewController.m
//  MapDemo
//
//  Created by casa on 13-12-11.
//  Copyright (c) 2013年 casa. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MKMapView+ZoomLevel.h"

@interface ViewController ()

@property (nonatomic, strong) MKMapView *mapView;

@end

@implementation ViewController
#pragma mark - getters and setters

#pragma mark - life circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView = mapView;
    self.mapView.delegate = self;
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(31.22f, 121.48f) zoomLevel:8 animated:NO];
    [self.view addSubview:self.mapView];
}

- (void)viewDidAppear:(BOOL)animated
{
    CLLocationCoordinate2D worldCoords[3] = { {43,-80}, {25,-80}, {25,-100} };
    
    MKPolygon *poly = [MKPolygon polygonWithCoordinates:worldCoords count:3];
    [self.mapView addOverlay:poly level:MKOverlayLevelAboveRoads];
}

- (void)mapView:(MKMapView *)mapView didAddOverlayRenderers:(NSArray *)renderers
{
    
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolygonRenderer *renderer = [[MKPolygonRenderer alloc] initWithPolygon:(MKPolygon *)overlay];
    renderer.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.5f];
    return renderer;
}

@end
