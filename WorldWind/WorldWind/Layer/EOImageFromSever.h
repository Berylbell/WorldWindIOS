//
//  EOImageFromSever.h
//  WorldWind
//
//  Created by Earth Observer on 6/12/13.
//  Copyright (c) 2013 NASA World Wind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorldWind/Layer/WWLayer.h"

@class WWSurfaceImage;
@class WWDrawContext;

@interface EOImageFromSever : WWLayer

@property (readonly, nonatomic) WWSurfaceImage* surfaceImage;

- (EOImageFromSever*) init;

- (void) retrieveImageWithName:(NSString*)fileName atLocation:(NSString*)atLocation toFilePath:(NSString*)toFilePath;

- (void) doRender:(WWDrawContext*)dc;


@end
