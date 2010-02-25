//
//  LiveViewController.h
//  gnarus
//
//  Created by Ben Cochran on 11/2/09.
//  Copyright 2009 Ben Cochran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ARKit/ARKit.h>
#import <GnarusToggleBar/GnarusToggleBar.h>
#import <LayerManager/LayerManager.h>
#import <MapKit/MapKit.h>
#import "GNAddLandmarkMapViewController.h"
#import "HUDView.h"

@interface LiveViewController : UIViewController <ARViewDelegate, CLLocationManagerDelegate, GNToggleBarDelegate, MKMapViewDelegate> {
	ARGeoViewController *_arViewController;
	
	MKMapView *_mapView;
	
	CLLocationManager *_locationManager;
	CLLocation *lastUsedLocation;
	
	BOOL pointingDown;
	
	GNToggleBarController *_toggleBarController;
	NSMutableDictionary *_itemsToLayers;
	
	int connectionCount;
}

@property (nonatomic, retain) ARGeoViewController *arViewController;
@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) GNToggleBarController *toggleBarController;
@property (nonatomic, retain) NSMutableDictionary *itemsToLayers;
@property (nonatomic, readonly) NSArray *userOrderedLayers;

@end