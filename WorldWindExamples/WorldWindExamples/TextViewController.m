/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: TextViewController.m 1366 2013-05-27 18:02:05Z tgaskins $
 */

#import <CoreGraphics/CoreGraphics.h>
#import "TextViewController.h"

@implementation TextViewController

- (TextViewController*) initWithFrame:(CGRect)frame
{
    self = [super init];

    [self setContentSizeForViewInPopover:frame.size];

    _textView = [[UITextView alloc] initWithFrame:frame];
    [_textView setEditable:NO];
    [_textView setFont:[UIFont systemFontOfSize:16]];

    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];

    [[self view] addSubview:_textView];
}

@end