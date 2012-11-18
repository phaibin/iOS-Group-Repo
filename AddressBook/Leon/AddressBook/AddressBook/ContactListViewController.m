//
//  MasterViewController.m
//  AddressBook
//
//  Created by Leon on 12-11-11.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "ContactListViewController.h"
#import "DetailViewController.h"
#import "LPContact.h"
#import "LPContactCell.h"
#import "LoginViewController.h"
#import "SettingsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ContactListViewController () {
    NSMutableDictionary *_contacts;
    NSMutableArray *_contactIndexes;
}
@end

@implementation ContactListViewController
{
    BOOL _isDeleting;
    LPBarButtonItem *_deleteButton;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    _contacts = [[NSMutableDictionary alloc] init];
    _contactIndexes = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactUpdated:) name:kUpdateContactNotification object:nil];
    [self downloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    self.navigationItem.leftBarButtonItem = [[LPBarButtonItem alloc] initWithType:LPBarButtonItemTypeNormal title:nil image:@"settings.png" target:self action:@selector(changeSettings:)];
    LPBarButtonItem *addButton = [[LPBarButtonItem alloc] initWithType:LPBarButtonItemTypeNormal title:nil image:@"add.png" target:self action:@selector(addContact:)];
    _deleteButton = [[LPBarButtonItem alloc] initWithType:LPBarButtonItemTypeNormal title:@"删除" image:nil target:self action:@selector(deleteContact:)];
    
    self.navigationItem.rightBarButtonItems = @[addButton, _deleteButton];
    
    UINavigationController *navLoginVC = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"NavLoginViewController"];
    [self presentModalViewController:navLoginVC animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
//    if (!_contacts) {
//        _contacts = [[NSMutableDictionary alloc] init];
//    }
//    [_contacts insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _contactIndexes.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSMutableArray *)_contacts[_contactIndexes[section]]).count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _contactIndexes[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LPContactCell *cell = (LPContactCell *)[tableView dequeueReusableCellWithIdentifier:@"ContactCell"];
    [cell prepareForTableView:tableView indexPath:indexPath];
    cell.cornerRadius = 5;
    
    NSMutableArray *keyContact = ((NSMutableArray *)_contacts[_contactIndexes[indexPath.section]]);
    LPContact *contact = keyContact[indexPath.row];
    cell.headerImageView.layer.cornerRadius = 3;
    cell.headerImageView.clipsToBounds = YES;
    cell.headerImageView.layer.borderWidth = 1;
    cell.headerImageView.layer.borderColor = [UIColor grayColor].CGColor;
    cell.headerImageView.image = [UIImage imageNamed:@"default_avatar.png"];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@(%@)", contact.chineseName, contact.englishName];
    cell.emailLabel.text = contact.email;
    cell.mobileLabel.text = contact.mobile;
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _contactIndexes;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *keyContact = ((NSMutableArray *)_contacts[_contactIndexes[indexPath.section]]);
        [keyContact removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self performBlock:^{
            [self.tableView reloadData];
        } afterDelay:0.25];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSMutableArray *keyContact = ((NSMutableArray *)_contacts[_contactIndexes[indexPath.section]]);
        LPContact *contact = keyContact[indexPath.row];
        [[segue destinationViewController] setContact:contact];
    }
}

- (void)downloadData
{
    [self addContactForKey:@"a"];
    [self addContactForKey:@"b"];
    [self addContactForKey:@"d"];
    [self addContactForKey:@"g"];
    [self addContactForKey:@"i"];
    
    [_contactIndexes addObjectsFromArray:[_contacts allKeys]];
    [_contactIndexes sortUsingSelector:@selector(compare:)];
}

- (void)addContactForKey:(NSString *)key
{
    NSMutableArray *keyContacts = _contacts[key];
    if (!keyContacts) {
        keyContacts = [NSMutableArray array];
        _contacts[key] = keyContacts;
    }
    for (int i=0; i<4; i++) {
        LPContact *contact = [[LPContact alloc] init];
        contact.chineseName = [NSString stringWithFormat:@"%@-%d", @"文祥", i];
        contact.englishName = @"Leon";
        contact.email = @"wen@wen.com";
        contact.mobile = @"1300000000";
        
        [keyContacts addObject:contact];
    }
}

- (IBAction)changeSettings:(id)sender
{
    UINavigationController *navSettingsVC = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"NavSettingsViewController"];
    [self presentModalViewController:navSettingsVC animated:YES];
}

- (IBAction)deleteContact:(id)sender
{
    _isDeleting = !_isDeleting;
    if (_isDeleting) {
        [_deleteButton setTitle:@"完成"];
    } else {
        [_deleteButton setTitle:@"删除"];
    }
    [self.tableView setEditing:_isDeleting animated:YES];
}

- (IBAction)addContact:(id)sender
{
    
}

- (void)contactUpdated:(NSNotification *)notification
{
    [self.tableView reloadData];
}

@end
