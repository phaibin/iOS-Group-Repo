//
//  LoginViewController.m
//  AddressBook
//
//  Created by Leon on 12-11-11.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "LoginViewController.h"
#import "BaseViewController.h"

#define kUserNameFiledTag 1001
#define kPasswordFiledTag 1002


@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    [self.userNameCell prepareForTableView:self.tableView indexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.passwordCell prepareForTableView:self.tableView indexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    self.userNameCell.cornerRadius = 5;
    self.passwordCell.cornerRadius = 5;
    self.userNameField.tag = kUserNameFiledTag;
    self.passwordField.tag = kPasswordFiledTag;
    [self.userNameField becomeFirstResponder];
    
    self.navigationItem.rightBarButtonItem = [BaseViewController customBarButtonItemWithTitle:@"确定" image:nil target:self action:@selector(login)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setUserNameCell:nil];
    [self setPasswordCell:nil];
    [self setUserNameField:nil];
    [self setPasswordField:nil];
    [super viewDidUnload];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == kUserNameFiledTag) {
        [self.passwordField becomeFirstResponder];
    } else {
        [self login];
    }
    return YES;
}

- (void)login
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)loginTapped:(id)sender {
    [self login];
}

@end
