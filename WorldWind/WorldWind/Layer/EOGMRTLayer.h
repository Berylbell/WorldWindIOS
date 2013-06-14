//
//  LDGMRTLayer.h
//  WorldWind
//
//  Created by Earth Observer on 6/4/13.
//  Copyright (c) 2013 NASA World Wind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorldWind/Layer/WWTiledImageLayer.h"
#import "WWLayerList.h"
#import "EOplistManager.h"
#import "WWRenderableLayer.h"
/**
 * Using Marine-Geo imports base map from the GEOMap App
 */
@interface EOGMRTLayer : WWRenderableLayer

/// @name Initializing GMRT

@property EOplistManager* plist;
/**
 * Initializes an GMRT layer.
 *
 * @return The initialized layer.
 */
- (id) initWithPlist: (NSString*) plistName ;

-(WWLayerList*) addLayersToLayerList: (WWLayerList*) layerList;

@end
