//
//  EOTileURLBuilder.m
//  WorldWind
//
//  Created by Earth Observer on 6/13/13.
//  Copyright (c) 2013 NASA World Wind. All rights reserved.
//

#import "EOTileURLBuilder.h"
#import "WorldWind/Util/WWTile.h"
#import "WorldWind/Geometry/WWSector.h"
#import "WorldWind/WWLog.h"
#import "WWLevel.h"

@implementation EOTileURLBuilder


-(EOTileURLBuilder*) initWithServiceAddress:(NSString *)serviceAddress fileType :(NSString*) fileType {
    
    if(self= [super init]){
        
        _serviceAddress =serviceAddress;
        _fileType =fileType;
    }
    
    return self;
}

//Builds url from imported variables
-(NSURL*) urlForTile:(WWTile *)tile imageFormat:(NSString *)imageFormat {
    
   // WWSector* s = [tile sector];
    WWLevel* level = [tile level];
    NSMutableString* urlHolder =[[NSMutableString alloc] init];
    
    [urlHolder appendString:_serviceAddress];
    [urlHolder appendFormat:@"/%d", [level levelNumber]];
    [urlHolder appendFormat:@"/%d", [tile row]];
    [urlHolder appendFormat:@"/%d_%d", [tile row], [tile column]];
    [urlHolder appendFormat:@"%@", _fileType];
    
    NSURL* urlFinal= [[NSURL alloc] initWithString:urlHolder];
    
    
    NSString* placeHolderURL= [[NSString alloc]initWithFormat:@"http://www.ldeo.columbia.edu/~berylb/TransparentImage%@", _fileType];
    
    NSURL* placeHolder =[[NSURL alloc]initWithString:placeHolderURL];
    
    if (urlFinal == nil) {
        return placeHolder;
    }
    
    NSURLRequest* request =[NSURLRequest requestWithURL:urlFinal];
    NSHTTPURLResponse* response= nil;
    NSError* error= nil;
    
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if ([response statusCode]==404 || [response statusCode] ==403) {
        NSLog(@"404 or 403");
        return placeHolder;
    }
    
    NSLog(urlHolder);
    return urlFinal;
    
}
@end
