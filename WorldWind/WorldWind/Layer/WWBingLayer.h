/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: WWBingLayer.h 1135 2013-01-26 17:08:52Z tgaskins $
 */

#import <Foundation/Foundation.h>
#import "WorldWind/Layer/WWTiledImageLayer.h"

/**
* Represents Bing imagery from Microsoft.
*/
@interface WWBingLayer : WWTiledImageLayer

/// @name Initializing the Layer

/**
* Initializes the layer.
*
* @return The initialized layer.
*/
- (WWBingLayer*) init;

@end