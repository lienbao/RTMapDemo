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
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(31.22f, 121.48f) zoomLevel:10 animated:NO];
    [self.view addSubview:self.mapView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapedMapview:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    [self.mapView addGestureRecognizer:tapGestureRecognizer];
}

- (void)viewDidAppear:(BOOL)animated
{
    CLLocationCoordinate2D worldCoords[] = {
            {31.308606 , 121.369635},
            {31.30471  , 121.349597}, 
            {31.299667 , 121.344369}, 
            {31.296721 , 121.331498}, 
            {31.291206 , 121.336242}, 
            {31.292194 , 121.338823}, 
            {31.280265 , 121.344   },
            {31.275137 , 121.375549}, 
            {31.272501 , 121.373058}, 
            {31.273195 , 121.366579}, 
            {31.26546  , 121.368432}, 
            {31.263419 , 121.387532}, 
            {31.249926 , 121.382316}, 
            {31.253107 , 121.374967}, 
            {31.24586  , 121.369701}, 
            {31.246065 , 121.362705}, 
            {31.243052 , 121.36074 },  
            {31.232263 , 121.367677}, 
            {31.225553 , 121.380136}, 
            {31.224124 , 121.405596}, 
            {31.22999  , 121.421803}, 
            {31.234664 , 121.421693}, 
            {31.231671 , 121.427416}, 
            {31.241491 , 121.437545}, 
            {31.249636 , 121.456481}, 
            {31.262609 , 121.457521}, 
            {31.273917 , 121.44897 },  
            {31.281254 , 121.436295}, 
            {31.272878 , 121.427543}, 
            {31.27209  , 121.422203}, 
            {31.279141 , 121.417414}, 
            {31.278913 , 121.411944}, 
            {31.28219  , 121.413008}, 
            {31.284302 , 121.406259}, 
            {31.291382 , 121.410787}, 
            {31.297022 , 121.400145}, 
            {31.300357 , 121.40121 },  
            {31.299661 , 121.390114}, 
            {31.294788 , 121.387613}, 
            {31.294613 , 121.372448}, 
            {31.298987 , 121.367214}, 
            {31.308606 , 121.369635}
    };
    
    MKPolygon *poly = [MKPolygon polygonWithCoordinates:worldCoords count:sizeof(worldCoords)/sizeof(worldCoords[0])];
    [self.mapView addOverlay:poly level:MKOverlayLevelAboveRoads];
}

#pragma mark - MKMapViewDelegate
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolygonRenderer *renderer = [[MKPolygonRenderer alloc] initWithPolygon:(MKPolygon *)overlay];
    renderer.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.5f];
    return renderer;
}

#pragma mark - UIGestureRecognizerDelegate

#pragma mark - event response
- (void)didTapedMapview:(UITapGestureRecognizer *)gesture
{
    CGPoint point = [gesture locationInView:self.mapView];
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    CGPoint coordinatePoint = CGPointMake(coordinate.latitude, coordinate.longitude);
    CGPoint points[] = {
        {31.308606 , 121.369635},
        {31.30471  , 121.349597},
        {31.299667 , 121.344369},
        {31.296721 , 121.331498},
        {31.291206 , 121.336242},
        {31.292194 , 121.338823},
        {31.280265 , 121.344   },
        {31.275137 , 121.375549},
        {31.272501 , 121.373058},
        {31.273195 , 121.366579},
        {31.26546  , 121.368432},
        {31.263419 , 121.387532},
        {31.249926 , 121.382316},
        {31.253107 , 121.374967},
        {31.24586  , 121.369701},
        {31.246065 , 121.362705},
        {31.243052 , 121.36074 },
        {31.232263 , 121.367677},
        {31.225553 , 121.380136},
        {31.224124 , 121.405596},
        {31.22999  , 121.421803},
        {31.234664 , 121.421693},
        {31.231671 , 121.427416},
        {31.241491 , 121.437545},
        {31.249636 , 121.456481},
        {31.262609 , 121.457521},
        {31.273917 , 121.44897 },
        {31.281254 , 121.436295},
        {31.272878 , 121.427543},
        {31.27209  , 121.422203},
        {31.279141 , 121.417414},
        {31.278913 , 121.411944},
        {31.28219  , 121.413008},
        {31.284302 , 121.406259},
        {31.291382 , 121.410787},
        {31.297022 , 121.400145},
        {31.300357 , 121.40121 },
        {31.299661 , 121.390114},
        {31.294788 , 121.387613},
        {31.294613 , 121.372448},
        {31.298987 , 121.367214},
        {31.308606 , 121.369635}
    };
    CGMutablePathRef mutablePathRef = CGPathCreateMutable();
    CGPathAddLines(mutablePathRef, NULL, points, sizeof(points)/sizeof(points[0]));
    if (CGPathContainsPoint(mutablePathRef, NULL, coordinatePoint, false)) {
        NSLog(@"in");
        NSInteger count = sizeof(points)/sizeof(points[0]);
        CGFloat maxLat = CGFLOAT_MIN;
        CGFloat minLat = CGFLOAT_MAX;
        CGFloat maxLng = CGFLOAT_MIN;
        CGFloat minLng = CGFLOAT_MAX;
        while (count) {
            CGPoint iteratedPoint = points[count-1];
            if (iteratedPoint.x >= maxLat) {
                maxLat = iteratedPoint.x;
            }
            if (iteratedPoint.x <= minLat) {
                minLat = iteratedPoint.x;
            }
            if (iteratedPoint.y >= maxLng) {
                maxLng = iteratedPoint.y;
            }
            if (iteratedPoint.y <= minLng) {
                minLng = iteratedPoint.y;
            }
            count--;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"price" message:@"expensice" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
        NSLog(@"out");
    }
}

@end
