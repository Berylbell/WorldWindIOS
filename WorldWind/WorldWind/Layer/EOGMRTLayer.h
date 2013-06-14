//
//  LDGMRTLayer.h
//  WorldWind
//
//  Created by Earth Observer on 6/4/13.
//  Copyright (c) 2013 NASA World Wind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorldWind/Layer/WWTiledImageLayer.h"

/**
 * Using Marine-Geo imports base map from the GEOMap App
 */
@interface LDGMRTLayer : WWTiledImageLayer

/// @name Initializing GMRT

/**
 * Initializes an GMRT layer.
 *
 * @return The initialized layer.
 */
- (LDGMRTLayer*) init;

@end
