/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.

@version $Id: TrackingController.h 1255 2013-04-01 22:19:09Z dcollins $
 */

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "WorldWind/WorldWindView.h"

@interface TrackingController : NSObject <CLLocationManagerDelegate>

@property (nonatomic, readonly) WorldWindView* view;

@property (nonatomic, getter=isEnabled) BOOL enabled;

- (TrackingController*) initWithView:(WorldWindView*)view;

@end