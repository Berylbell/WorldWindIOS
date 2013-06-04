/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: WWMemoryCacheListener.h 1007 2012-12-20 20:35:59Z tgaskins $
 */

@protocol WWMemoryCacheListener <NSObject>

- (void) entryRemovedForKey:(id <NSCopying>)key value:(id)value;

- (void) removalException:(NSException*)exception key:(id <NSCopying>)key value:(id)value;

@end