//
//  EOplistManager.h
//  WorldWind
//
//  Created by Earth Observer on 6/6/13.
//  Copyright (c) 2013 NASA World Wind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOplistManager : NSObject

@property (nonatomic, readonly) NSString* plistLocation;
@property (nonatomic, readonly) NSArray* plistContent;

-(id) initWithPlistLocation: (NSString*) plistLocation;
-(NSString*) getURLAtLocation: (NSInteger*) location;
-(NSString*) getURLAtLocationDepth:(NSInteger*) location atDepth: (NSInteger*) depth;
-(NSString*) getTypeAtLocation: (NSInteger*) location;
-(NSString*) getTypeAtLocationDepth:(NSInteger*) location atDepth: (NSInteger*) depth ;

@end
