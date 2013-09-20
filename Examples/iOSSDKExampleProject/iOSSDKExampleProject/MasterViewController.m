//
//  MasterViewController.m
//  iOSSDKExampleProject
//
//  Created by Andrew Yates on 05/06/2013.
//  Copyright (c) 2013 Andrew Yates. All rights reserved.
//

#import "MasterViewController.h"
#import "ExampleViewController.h"
#import "BufferSDK.h"

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Examples", @"Examples");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    if(indexPath.row == 0){
        cell.textLabel.text = @"Normal Presentation";
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    if(indexPath.row == 1){
        cell.textLabel.text = @"UIActivity Presentation";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        ExampleViewController *exampleView = [[ExampleViewController alloc] init];
        [self.navigationController pushViewController:exampleView animated:YES];
    }
    
    if(indexPath.row == 1){
        NSString *text = @"I'm using the Buffer SDK UIActivity";
        NSURL *url = [NSURL URLWithString:@"http://bufferapp.com/"];
        
        NSArray *activityItems = @[text, url];
        
        UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:@[ [BufferSDK bufferUIActivity] ]];
        
        [self presentViewController:activityView animated:YES completion:nil];
    }
}

@end
