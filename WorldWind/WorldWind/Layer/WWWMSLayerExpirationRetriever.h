/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: WWWMSLayerExpirationRetriever.h 1356 2013-05-22 23:40:15Z tgaskins $
 */

#import <Foundation/Foundation.h>

@class WWLayer;
@class WWTiledImageLayer;

@interface WWWMSLayerExpirationRetriever : NSOperation

@property(nonatomic, readonly) id layer;
@property(nonatomic, readonly) NSString* layerName;
@property(nonatomic, readonly) NSString* serviceAddress;

- (WWWMSLayerExpirationRetriever*) initWithLayer:(id)layer
                                     layerName:(NSString*)layerName
                                serviceAddress:(NSString*)serviceAddress;

@end