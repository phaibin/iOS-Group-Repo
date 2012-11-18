//
//  DetailViewController.m
//  AddressBook
//
//  Created by Leon on 12-11-11.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PrettyTableViewCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
{
    BOOL _isEditing;
    LPBarButtonItem *_editButton;
    UITextField *_mobileField;
    UITextField *_emailField;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = [[LPBarButtonItem alloc] initWithType:LPBarButtonItemTypeBackward title:@"通讯录" image:nil target:self action:@selector(back:)];
    _editButton = [[LPBarButtonItem alloc] initWithType:LPBarButtonItemTypeNormal title:@"编辑" image:nil target:self action:@selector(editContact:)];
    self.navigationItem.rightBarButtonItem = _editButton;
    
    self.headerImageView.layer.cornerRadius = 3;
    self.headerImageView.clipsToBounds = YES;
    self.headerImageView.layer.borderWidth = 1;
    self.headerImageView.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.headerImageView.image = [UIImage imageNamed:@"default_avatar.png"];
    self.chineseNameLabel.text = self.contact.chineseName;
    self.englishNameLabel.text = self.contact.englishName;
}

- (IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)editContact:(id)sender
{
    _isEditing = !_isEditing;
    if (_isEditing) {
        [_editButton setTitle:@"完成"];
        [self performBlock:^{
            [_mobileField becomeFirstResponder];
        } afterDelay:0.1];
    } else {
        [_editButton setTitle:@"编辑"];
        self.contact.mobile = _mobileField.text;
        self.contact.email = _emailField.text;
        [[NSNotificationCenter defaultCenter] postNotificationName:kUpdateContactNotification object:nil];
    }
//    [self.tableView setEditing:_isEditing animated:YES];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isEditing) {
        PrettyTableViewCell *cell = (PrettyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"EditableCell"];
        [cell prepareForTableView:tableView indexPath:indexPath];
        cell.cornerRadius = 5;
        
        UILabel *contactFieldLabel = (UILabel *)[cell.contentView viewWithTag:1000];
        UITextField *contactValueField = (UITextField *)[cell.contentView viewWithTag:1001];
        switch (indexPath.row) {
            case 0: {
                contactFieldLabel.text = @"手机";
                contactValueField.text = self.contact.mobile;
                _mobileField = contactValueField;
                break;
            }
            case 1:
                contactFieldLabel.text = @"邮箱";
                contactValueField.text = self.contact.email;
                _emailField = contactValueField;
            default:
                break;
        }
        return cell;
    } else {
        PrettyTableViewCell *cell = (PrettyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"NormalCell"];
        [cell prepareForTableView:tableView indexPath:indexPath];
        cell.cornerRadius = 5;
        
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"手机";
                cell.detailTextLabel.text = self.contact.mobile;
                break;
            case 1:
                cell.textLabel.text = @"邮箱";
                cell.detailTextLabel.text = self.contact.email;
            default:
                break;
        }
        return cell;
    }
}

@end
