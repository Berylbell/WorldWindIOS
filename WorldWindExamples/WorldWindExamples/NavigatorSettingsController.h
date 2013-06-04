/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: NavigatorSettingsController.h 1311 2013-04-28 19:32:34Z dcollins $
 */

#import <Foundation/Foundation.h>

@class WorldWindView;

@interface NavigatorSettingsController : UITableViewController
{
@protected
    NSArray* modelTypes;
    id selectedModelType;
}

@property (nonatomic, readonly) WorldWindView* wwv;

- (NavigatorSettingsController*) initWithWorldWindView:(WorldWindView*)wwv;

@end