//
//  LDGMRTLayer.m
//  WorldWind
//
//  Created by Earth Observer on 6/4/13.
//  Copyright (c) 2013 NASA World Wind. All rights reserved.
//

#import "LDGMRTLayer.h"
#import "WorldWind/Util/WWWMSUrlBuilder.h"
#import "WorldWind/Layer/WWWMSLayerExpirationRetriever.h"
#import "WorldWind/WorldWind.h"
#import "WorldWind/Geometry/WWSector.h"
#import "WorldWind/Geometry/WWLocation.h"

@implementation LDGMRTLayer

- (LDGMRTLayer*) init
{
    NSString* layerName = @"gmrt";
    NSString* serviceAddress = @"http://www.marine-geo.org/services/wms_2.0_merc";
    
    
    NSString* cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* cachePath = [cacheDir stringByAppendingPathComponent:@"GMRT"];
    
    self = [super initWithSector:[[WWSector alloc] initWithFullSphere]
                  levelZeroDelta:[[WWLocation alloc] initWithDegreesLatitude:45 longitude:45]
                       numLevels:5
            retrievalImageFormat:@"image/jpeg"
                       cachePath:cachePath];
    [self setDisplayName:@"GMRT"];
    
    WWWMSUrlBuilder* urlBuilder = [[WWWMSUrlBuilder alloc] initWithServiceAddress:serviceAddress
                                                                       layerNames:layerName
                                                                       styleNames:@""
                                                                       wmsVersion:@"1.3.0"];
    [self setUrlBuilder:urlBuilder];
    
    WWWMSLayerExpirationRetriever* expirationChecker =
    [[WWWMSLayerExpirationRetriever alloc] initWithLayer:self
                                               layerName:layerName
                                          serviceAddress:serviceAddress];
    [[WorldWind loadQueue] addOperation:expirationChecker];
    
    return self;
}

@end
