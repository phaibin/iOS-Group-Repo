//
//  LoginViewController.h
//  AddressBook
//
//  Created by Leon on 12-11-11.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrettyTableViewCell.h"

@interface LoginViewController : BaseTableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet PrettyTableViewCell *userNameCell;
@property (weak, nonatomic) IBOutlet PrettyTableViewCell *passwordCell;
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)loginTapped:(id)sender;

@end
