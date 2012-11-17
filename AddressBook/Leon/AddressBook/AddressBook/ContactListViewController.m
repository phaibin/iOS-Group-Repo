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

@interface ContactListViewController () {
    NSMutableDictionary *_contacts;
    NSMutableArray *_contactIndexes;
}
@end

@implementation ContactListViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    _contacts = [[NSMutableDictionary alloc] init];
    _contactIndexes = [[NSMutableArray alloc] init];
    [self downloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    self.navigationItem.leftBarButtonItem = [[LPBarButtonItem alloc] initWithType:LPBarButtonItemTypeNormal title:nil image:@"settings.png" target:self action:@selector(changeSettings:)];
    
    LPBarButtonItem *addButton = [[LPBarButtonItem alloc] initWithType:LPBarButtonItemTypeNormal title:nil image:@"add.png" target:self action:@selector(addContact:)];
    LPBarButtonItem *editButton = [[LPBarButtonItem alloc] initWithType:LPBarButtonItemTypeNormal title:@"编辑" image:nil target:self action:@selector(editContact:)];

    self.navigationItem.rightBarButtonItems = @[addButton, editButton];
    
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
    cell.imageView.image = [UIImage imageNamed:@"default_avatar.png"];
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
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_contacts removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _contacts[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
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
    for (int i=0; i<3; i++) {
        LPContact *contact = [[LPContact alloc] init];
        contact.chineseName = @"文祥";
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

- (IBAction)editContact:(id)sender
{
    
}

- (IBAction)addContact:(id)sender
{
    
}

@end
