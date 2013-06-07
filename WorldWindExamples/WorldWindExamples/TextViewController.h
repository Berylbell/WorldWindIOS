/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: TextViewController.h 1366 2013-05-27 18:02:05Z tgaskins $
 */

#import <Foundation/Foundation.h>

@interface TextViewController : UIViewController

@property(nonatomic, readonly) UITextView* textView;

- (TextViewController*)initWithFrame:(CGRect)frame;

@end