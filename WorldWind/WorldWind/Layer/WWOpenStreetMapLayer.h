/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: WWOpenStreetMapLayer.h 1237 2013-03-15 17:37:22Z tgaskins $
 */

#import <Foundation/Foundation.h>
#import "WorldWind/Layer/WWTiledImageLayer.h"

/**
* Displays Open Street Map imagery.
*/
@interface WWOpenStreetMapLayer : WWTiledImageLayer

/// @name Initializing the Layer

/**
* Initializes the layer.
*
* @return The initialized layer.
*/
- (WWOpenStreetMapLayer*) init;

@end