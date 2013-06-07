/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: CrashDataViewController.h 1339 2013-05-14 16:45:05Z tgaskins $
 */

#import <Foundation/Foundation.h>

/**
* Presents a view showing crash data.
*/
@interface CrashDataViewController : UITableViewController

/// @name Attributes

/// A dictionary of crash data.
@property(nonatomic) NSDictionary* entries;

/// @name Initializing

/**
* Initializes this instance.
*
* @return This instance, initialized.
*/
- (CrashDataViewController*) init;

@end