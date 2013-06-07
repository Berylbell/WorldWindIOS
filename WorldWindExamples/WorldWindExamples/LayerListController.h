/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: LayerListController.h 1145 2013-01-29 21:05:16Z tgaskins $
 */

#import <Foundation/Foundation.h>

@class WorldWindView;


@interface LayerListController : UITableViewController

@property (nonatomic, readonly) WorldWindView* wwv;

- (LayerListController*) initWithWorldWindView:(WorldWindView*)wwv;

@end