//
//  EOplistManager.m
//  WorldWind
//
//  Created by Earth Observer on 6/6/13.
//  Copyright (c) 2013 NASA World Wind. All rights reserved.
//

#import "EOplistManager.h"

@implementation EOplistManager

-(id) initWithPlistLocation:(NSString *)plistLocation {
    
    if(self= [super init]){
        
        _plistLocation= plistLocation;
        _plistContent= [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:_plistLocation ofType:@"plist"]];
    }
    return self;
}

-(NSString*) getURLAtLocation: (NSInteger*) location {
    
    if ([[[_plistContent objectAtIndex:location] objectForKey:@"type"] isEqualToString:@"dir"]) {
        
        NSLog(@"Type: %@",[[_plistContent objectAtIndex:location] objectForKey:@"type"]);
        
        return @"http://www.ldeo.columbia.edu/~berylb/TransparentImage";
        }

    NSLog(@" URL: %@",[[_plistContent objectAtIndex:location] objectForKey: @"source"]);
    return [[_plistContent objectAtIndex:location] objectForKey: @"source"];

}



-(NSString*) getTypeAtLocation: (NSInteger*) location {
    
    if ([[[_plistContent objectAtIndex:location] objectForKey:@"type"] isEqualToString:@"dir"]) {
        
        return @".png";
    }
    NSLog(@"Type: %@",[[_plistContent objectAtIndex:location] objectForKey: @"imageType"]);
    return [[_plistContent objectAtIndex:location] objectForKey: @"imageType"];
    
}


-(NSString*) getURLAtLocationDepth:(NSInteger*) location atDepth: (NSInteger*) depth {
    
    if ([[[_plistContent objectAtIndex:location] objectForKey:@"type"] isEqualToString:@"dir"]) {
        
        if ([[[_plistContent objectAtIndex:depth] objectForKey:@"type"] isEqualToString:@"dir"]) {
            
            return @"http://www.ldeo.columbia.edu/~berylb/TransparentImage";
        }
        
        return [[[[_plistContent objectAtIndex:location] objectForKey:@"children"] objectAtIndex:depth] objectForKey:@"source"];
    }
    return [[_plistContent objectAtIndex:location] objectForKey: @"source"];
}


-(NSString*) getTypeAtLocationDepth:(NSInteger*) location atDepth: (NSInteger*) depth {
    
    if ([[[_plistContent objectAtIndex:location] objectForKey:@"type"] isEqualToString:@"dir"]) {
        
        if ([[[_plistContent objectAtIndex:depth] objectForKey:@"type"] isEqualToString:@"dir"]) {
            
            return @".png";
        }
        
        return [[[[_plistContent objectAtIndex:location] objectForKey:@"children"] objectAtIndex:depth] objectForKey:@"imageType"];
    }
    return [[_plistContent objectAtIndex:location] objectForKey: @"imageType"];
}

@end
