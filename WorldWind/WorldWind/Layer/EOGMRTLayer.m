//
//  LDGMRTLayer.m
//  WorldWind
//
//  Created by Earth Observer on 6/4/13.
//  Copyright (c) 2013 NASA World Wind. All rights reserved.
//

#import "EOGMRTLayer.h"
#import "WorldWind/Util/WWWMSUrlBuilder.h"
#import "WorldWind/Layer/WWWMSLayerExpirationRetriever.h"
#import "WorldWind/WorldWind.h"
#import "WorldWind/Geometry/WWSector.h"
#import "WorldWind/Geometry/WWLocation.h"
#import "worldWind/Util/EOTileURLBuilder.h"

@implementation EOGMRTLayer

- (id) initWithPlist:(NSString *)plistName 
{
    _plist = [[EOplistManager alloc] initWithPlistLocation: plistName];
    
    //NSString* layerName = @"bluemarbleapr";
//    NSString* serviceAddress = [plist getURLAtLocationDepth:6 atDepth:2];
//    NSString* retrievalType = [plist getTypeAtLocationDepth:6 atDepth:2];
//    
//    NSLog(@" Recieved Address %@", serviceAddress);
//    NSLog(@" Recived Type %@",retrievalType);
//    
//    NSString* cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString* cachePath = [cacheDir stringByAppendingPathComponent:@"BlueMarbleApr"];
//    
//    self = [super initWithSector:[[WWSector alloc] initWithFullSphere]
//                  levelZeroDelta:[[WWLocation alloc] initWithDegreesLatitude:180 longitude:180]
//                       numLevels:5
//            retrievalImageFormat:@"image/png"
//                       cachePath:cachePath];
//    [self setDisplayName:@"Blue Marble April"];
//    
//    EOTileURLBuilder* urlBuilder =[[EOTileURLBuilder alloc] initWithServiceAddress:serviceAddress fileType: retrievalType];
//    
//
//    
//    [self setUrlBuilder:urlBuilder];
    
    return self;
}

-(WWLayerList*) addLayersToLayerList: (WWLayerList*) layerList {
    
    for( NSMutableDictionary* dict in [_plist plistContent]) {
        if([[dict objectForKey:@"type"] isEqualToString:@"dir"]) {
            [layerList addLayer: [self buildGroupLayer:[dict objectForKey:@"children"] arrayName:[dict objectForKey:@"name"]]];
        }
        else
        {
            [layerList addLayer:[self buildLayer:dict]];
        }
    }
    return layerList;
}

-(EOGMRTLayer*) buildGroupLayer: (NSArray*) arrayofDicts arrayName: (NSString*) arrayName {
    
    EOGMRTLayer* temp = [[EOGMRTLayer alloc]init];
    [temp setDisplayName:arrayName];
    
    WWTiledImageLayer* layer;
    for( NSMutableDictionary* dict in arrayofDicts) {
        layer= [self buildLayer:dict];
        [layer setEnabled:NO];
        [temp addRenderable:layer];
    }
    return temp;
}
-(WWTiledImageLayer*) buildLayer: (NSMutableDictionary*) plistDictionary{
    
    NSString* cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* cachePath = [cacheDir stringByAppendingPathComponent:[[plistDictionary objectForKey:@"name"] stringByReplacingOccurrencesOfString:@" " withString:@""]];
    
    WWSector* sector = [[WWSector alloc] initWithDegreesMinLatitude:-85.0511287798 maxLatitude:85.0511287798
                                                       minLongitude:-180 maxLongitude:180];
  
    NSInteger* numLevels = [[plistDictionary objectForKey:@"tileDelta"] integerValue];
    NSString* imageType = [[plistDictionary objectForKey:@"imageType"] stringByReplacingOccurrencesOfString:@"." withString:@"image/"];
    if( numLevels <1) {numLevels = 1;}
    if(imageType == nil) { imageType= @"image/jpg";}
    
    NSLog(imageType);
    WWTiledImageLayer* layer = [[WWTiledImageLayer alloc] initWithSector:sector
                                                          levelZeroDelta:[[WWLocation alloc]
                                                                          initWithDegreesLatitude:180 longitude:180]
                                                               numLevels:numLevels
                                                    retrievalImageFormat:imageType cachePath:cachePath];
    
    [layer setDisplayName:[plistDictionary objectForKey:@"name"]];
    
    NSString* serviceLocation = [plistDictionary objectForKey:@"source"];
    EOTileURLBuilder* urlBuilder = [[EOTileURLBuilder alloc] initWithServiceAddress:serviceLocation fileType:[plistDictionary objectForKey: @"imageType"]];
    
    [layer setUrlBuilder:urlBuilder];
    
    return layer;

}

@end
