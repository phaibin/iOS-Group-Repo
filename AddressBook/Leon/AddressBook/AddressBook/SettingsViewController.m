//
//  SettingsViewController.m
//  AddressBook
//
//  Created by Leon on 12-11-17.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[LPBarButtonItem alloc] initWithType:LPBarButtonItemTypeNormal title:@"完成" image:nil target:self action:@selector(done:)];
    [self.userCell prepareForTableView:self.tableView indexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.aboutCell prepareForTableView:self.tableView indexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    self.userCell.cornerRadius = 5;
    self.aboutCell.cornerRadius = 5;
}

- (IBAction)done:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setUserCell:nil];
    [super viewDidUnload];
}
@end
