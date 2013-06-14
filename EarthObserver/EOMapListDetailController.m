//
//  EOMapListDetailController.m
//  EarthObserver
//
//  Created by Earth Observer on 6/11/13.
//  Copyright (c) 2013 Earth Observer. All rights reserved.
//

#import "EOMapListDetailController.h"

@implementation EOMapListDetailController{
    NSArray* maps;
}

@synthesize tableView= _tableView;
@synthesize mapDictionary;

- (void) viewDidLoad{
    
    [super viewDidLoad];
    
    
    maps = [mapDictionary objectForKey:@"children"];
    
    NSMutableArray* temp = [[NSMutableArray alloc]init];
    
    for (NSDictionary* dict in maps) {
        [temp addObject:[dict objectForKey:@"name"]];
    }
    maps= temp;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [maps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [maps objectAtIndex:indexPath.row];
    return cell;
}


@end
