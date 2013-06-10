//
//  EOListViewController.h
//  EarthObserver
//
//  Created by Earth Observer on 6/7/13.
//  Copyright (c) 2013 Earth Observer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOListViewController : UITableViewController 

@property (nonatomic, readonly) NSString *libraryPlist;
@property (nonatomic, readonly) NSArray *libraryContent;

- (id) initWithLibraryName: (NSString *) libraryName;
- (id) initWithArrayAndParentName: (NSArray *) libraryArray : (NSString *) libraryName;

@end
