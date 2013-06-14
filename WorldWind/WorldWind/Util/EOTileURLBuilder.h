//
//  EOTileURLBuilder.h
//  WorldWind
//
//  Created by Earth Observer on 6/13/13.
//  Copyright (c) 2013 NASA World Wind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWUrlBuilder.h"


@interface EOTileURLBuilder : NSObject <WWUrlBuilder>

@property(nonatomic, readonly) NSString* serviceAddress;

@property (nonatomic, readonly) NSString* fileType;

-(EOTileURLBuilder*) initWithServiceAddress: (NSString*) serviceAddress
                                   fileType:(NSString*) fileType;

@end
