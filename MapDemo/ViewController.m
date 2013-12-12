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
#import "Factory.h"

@interface ViewController ()

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) Factory *factory;

@end

@implementation ViewController
#pragma mark - getters and setters
- (Factory *)factory
{
    if (_factory == nil) {
        _factory = [[Factory alloc] init];
    }
    return _factory;
}

#pragma mark - life circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView = mapView;
    self.mapView.delegate = self;
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(31.22f, 121.48f) zoomLevel:10 animated:NO];
    [self.view addSubview:self.mapView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapedMapview:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    [self.mapView addGestureRecognizer:tapGestureRecognizer];
    
    [self.factory decodedData];

}

- (void)viewDidAppear:(BOOL)animated
{
    [self.mapView addOverlays:self.factory.polygonArray level:MKOverlayLevelAboveRoads];
}

#pragma mark - MKMapViewDelegate
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
//    NSInteger key = [self.factory.polygonArray indexOfObject:overlay];
    MKPolygonRenderer *renderer = [[MKPolygonRenderer alloc] initWithPolygon:(MKPolygon *)overlay];
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.5f];
    renderer.fillColor = color;
    return renderer;
}

#pragma mark - UIGestureRecognizerDelegate

#pragma mark - event response
- (void)didTapedMapview:(UITapGestureRecognizer *)gesture
{
    CGPoint point = [gesture locationInView:self.mapView];
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    CGPoint coordinatePoint = CGPointMake(coordinate.latitude, coordinate.longitude);
    
    NSInteger counter = 0;
    for (id path in self.factory.pathArray) {
        
        if (CGPathContainsPoint(CFBridgingRetain(path), NULL, coordinatePoint, false)) {
           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"price" message:self.factory.nameArray[counter] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
           [alert show];
        }
        
        counter++;
    }
    
}

@end
