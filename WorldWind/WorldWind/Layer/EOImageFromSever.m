//
//  EOImageFromSever.m
//  WorldWind
//
//  Created by Earth Observer on 6/12/13.
//  Copyright (c) 2013 NASA World Wind. All rights reserved.
//

#import "EOImageFromSever.h"
#import "WorldWind/Shapes/WWSurfaceImage.h"
#import "WorldWind/Geometry/WWSector.h"
#import "WorldWind/WWLog.h"
#import "WorldWind/Render/WWDrawContext.h"

@implementation EOImageFromSever

-(EOImageFromSever*) init {
    
    self= [super init];
    NSString* networkLocation = @"http://www.ldeo.columbia.edu/~berylb";
    
    NSString* imageFileName= @"TestMap.png";
    
    [self setDisplayName:@"Blue Marble Image GeoMap"];
    
    NSString* cacheDir =[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString* filePath = [cacheDir stringByAppendingPathComponent:imageFileName];
    BOOL fileExists= [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    
    if(!fileExists) {
        
        WWLog(@"File does not exist");
        [self retrieveImageWithName:imageFileName atLocation:networkLocation toFilePath:filePath];
        fileExists= [[NSFileManager defaultManager] fileExistsAtPath:filePath];
        
    }
    
    if (!fileExists) {
        WWLog(@"Unable To Find or Retrieve GeoMap Data %@", imageFileName);
        return nil;
        
    }
    
    WWSector* sector = [[WWSector alloc] initWithFullSphere];
    _surfaceImage = [[WWSurfaceImage alloc] initWithImagePath:sector imagePath:filePath];
    
    return self;
}

-(void) retrieveImageWithName:(NSString *)fileName atLocation:(NSString *)atLocation toFilePath:(NSString *)toFilePath {
    
    NSString* urlPath= [NSString stringWithFormat:@"%@/%@", atLocation, fileName];
    NSURL* url = [NSURL URLWithString:urlPath];
    
    NSError* error= nil;
    NSData* data = [NSData dataWithContentsOfURL:url options:0 error:&error];
    
    if( error!=nil){
        WWLog("@Error\" %@\" retrieving %@", [error description], [url absoluteString]);
        return;
    }
    
    [data writeToFile:toFilePath options:0 error:&error];
    
    if(error != nil){
        WWLog("@Error\" %@\" retrieving %@", [error description], toFilePath);
        return;
    }
    
}

-(void) doRender:(WWDrawContext *)dc {
    
    if(_surfaceImage != nil){
        [_surfaceImage render:dc];
    }
}
@end
