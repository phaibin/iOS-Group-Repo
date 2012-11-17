//
//  BaseTableViewController.m
//  AddressBook
//
//  Created by Leon on 12-11-17.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "BaseTableViewController.h"

@implementation BaseTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.navigationController.viewControllers[0] == self)
        [self.navigationController setValue:[[PrettyNavigationBar alloc] init] forKeyPath:@"navigationBar"];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
}

@end
