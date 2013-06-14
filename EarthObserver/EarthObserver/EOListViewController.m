//
//  EOListViewController.m
//  EarthObserver
//
//  Created by Earth Observer on 6/7/13.
//  Copyright (c) 2013 Earth Observer. All rights reserved.
//

#import "EOListViewController.h"
@implementation EOListViewController

- (id) initWithLibraryName:(NSString *)libraryName {
    if(self = [super init]) {
        _libraryPlist= libraryName;
        
        _libraryContent = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_libraryPlist ofType:@"plist"]];
    }
    return self;
}

- (id) initWithArrayAndParentName:(NSArray *)libraryArray :(NSString *)libraryName {
    
    if(self = [super init]){
        _libraryContent = libraryArray;
        _libraryPlist = libraryName;
    }
    return self;
}

- (void) viewDidLoad{
    
    [super viewDidLoad];

    self.navigationItem.title =@" Maps";
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return (_libraryContent != nil) ? [_libraryContent count] : 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier =@"Cell";
    
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell== nil){
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *cellValue = [[_libraryContent objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.textLabel.text = cellValue;
    
    if ([[[_libraryContent objectAtIndex: indexPath.row] objectForKey:@"type"] isEqualToString:@"dir"]) {
        
        cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
        
    }
    return cell;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    
//    NSLog(@"Got Clicked!");
//    
//    NSMutableDictionary* overlayDict = [_libraryContent objectAtIndex:indexPath.row];
//    
//    if( [[overlayDict objectForKey:@"type"] isEqualToString:@"dir"] ){
//        _libraryContent= [overlayDict objectForKey:@"children"];
//        [tableView reloadData];
//    }
//
//}


@end
