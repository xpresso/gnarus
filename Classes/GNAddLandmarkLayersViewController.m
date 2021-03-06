//
//  GNAddLandmarkLayersViewController.m
//
//  Created by iComps on 2/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GNAddLandmarkLayersViewController.h"


@implementation GNAddLandmarkLayersViewController

@synthesize layers=_layers;

- (id)initWithLocation:(CLLocation *)location andLandmark:(GNLandmark *)landmark{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
		self.title = @"Layers";
		self.layers = nil;
		selectedLandmark = [landmark retain];
		selectedLocation = [location retain];
	}
    return self;
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.layers.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    // Set up the cell...
	GNLayer *layer = [self.layers objectAtIndex:indexPath.row];
	cell.textLabel.text = [layer name];
	if ([layer layerIsUserModifiable] == NO) {
		[cell.textLabel setTextColor:[UIColor lightGrayColor]];
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	}
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Push the editing view controller for the selected layer if it is user modifiable
	GNLayer *layer = [self.layers objectAtIndex:indexPath.row];
	if ([layer layerIsUserModifiable] == YES){
		selectedLayer = [layer retain];
		GNEditingTableViewController *editingViewController = (GNEditingTableViewController *)[layer getEditingViewControllerWithLocation:selectedLocation andLandmark:selectedLandmark];
		[self.navigationController pushViewController:editingViewController animated:YES];
	}
}

- (void)dealloc {
	[_layers release];
	[selectedLayer release];
	[selectedLocation release];
	[selectedLandmark release];
	
    [super dealloc];
}

@end