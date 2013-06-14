//
//  EODetailViewController.h
//  EarthObserverWorldWind
//
//  Created by Earth Observer on 6/6/13.
//  Copyright (c) 2013 Earth Observer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EODetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
