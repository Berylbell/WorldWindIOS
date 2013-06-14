//
//  EOMapListController.m
//  EarthObserver
//
//  Created by Earth Observer on 6/11/13.
//  Copyright (c) 2013 Earth Observer. All rights reserved.
//

#import "EOMapListController.h"
#import "EOMapListDetailController.h"
@implementation EOMapListController{
    NSArray* maps;
}

@synthesize tableView= _tableView;
-(void) viewDidLoad {
    [super viewDidLoad];
    
    maps= [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MapOverlays_merc" ofType:@"plist"]];
    NSMutableArray* temp = [[NSMutableArray alloc]init];
    for (NSDictionary* dict in maps) {
        [temp addObject:[dict objectForKey:@"name"]];
    }
    maps=temp;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"passMap"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EOMapListDetailController *destViewController = segue.destinationViewController;
        
        NSLog(@"%d", [self.tableView indexPathForSelectedRow].row);
        
        destViewController.mapDictionary = [[[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MapOverlays_merc" ofType:@"plist"]]objectAtIndex:indexPath.row];
    }
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
