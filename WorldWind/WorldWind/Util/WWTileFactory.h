/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: WWTileFactory.h 1073 2013-01-11 02:14:08Z tgaskins $
 */

#import <Foundation/Foundation.h>

@class WWTile;
@class WWSector;
@class WWLevel;

/**
* Provides an interface for tile creation. Applications typically do not use this protocol.
*/
@protocol WWTileFactory

/**
* Create a tile for a given sector, level and position with the level.
*
* @param sector The sector the tile spans.
* @param level The level the tile is a member of.
* @param row The tile's row number within the level.
* @param column The tile's column number within the level.
*
* @return The initialized tile.
*/
- (WWTile*) createTile:(WWSector*)sector level:(WWLevel*)level row:(int)row column:(int)column;

@end