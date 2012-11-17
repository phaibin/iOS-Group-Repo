//
//  AboutViewController.m
//  AddressBook
//
//  Created by Leon on 12-11-17.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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

    self.navigationItem.leftBarButtonItem = [[LPBarButtonItem alloc] initWithType:LPBarButtonItemTypeBackward title:@"设置" image:nil target:self action:@selector(back:)];
    [self.versionCell prepareForTableView:self.tableView indexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.descCell prepareForTableView:self.tableView indexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    self.versionCell.cornerRadius = 5;
    self.descCell.cornerRadius = 5;
}

- (IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
