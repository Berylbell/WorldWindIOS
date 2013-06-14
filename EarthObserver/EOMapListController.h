//
//  EOMapListController.h
//  EarthObserver
//
//  Created by Earth Observer on 6/11/13.
//  Copyright (c) 2013 Earth Observer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EOMapListController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end
