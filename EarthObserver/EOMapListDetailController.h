//
//  EOMapListDetailController.h
//  EarthObserver
//
//  Created by Earth Observer on 6/11/13.
//  Copyright (c) 2013 Earth Observer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOMapListDetailController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *mapDictionary;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
