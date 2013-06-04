/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: WWI3LandsatLayer.h 1117 2013-01-20 18:37:31Z tgaskins $
 */

#import <Foundation/Foundation.h>
#import "WorldWind/Layer/WWTiledImageLayer.h"


/**
* Represents Landsat imagery contributed by i-cubed.
*/
@interface WWI3LandsatLayer : WWTiledImageLayer

/// @name Initializing the Layer

/**
* Initializes the layer.
*
* @return The initialized layer.
*/
- (WWI3LandsatLayer*) init;

@end