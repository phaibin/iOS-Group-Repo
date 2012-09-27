//
//  syxMasterViewController.m
//  AddressBook
//
//  Created by shi jack on 12-9-27.
//  Copyright (c) 2012年 jje. All rights reserved.
//

#import "syxMasterViewController.h"

#import "syxDetailViewController.h"

@implementation syxMasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize allStaffArray = _allStaffArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"锦江电商通讯录", @"锦江电商通讯录");
    }
    return self;
}
							
- (void)dealloc
{
    [_detailViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//去掉cell的钱
    self.tableView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* dataPath = [bundle pathForResource:@"addressbook" ofType:@"plist"];
    NSArray* tempArray = [[NSArray alloc]initWithContentsOfFile:dataPath];
    self.allStaffArray = tempArray;
    [tempArray release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark --- UITableView datasource and delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allStaffArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    StaffCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[StaffCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    int row = indexPath.row;
    NSDictionary* cellDic = [self.allStaffArray objectAtIndex:row];
    [cell setDicData:cellDic];

//    UILabel *labelCellText = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, 240, 45)];
//    labelCellText.backgroundColor = [UIColor clearColor];
//    labelCellText.tag = row;
//    labelCellText.textColor = [UIColor blackColor];
    
//    labelCellText.text = [cellDic objectForKey:@"名"];
    //cell.textLabel.text = [cellDic objectForKey:@"名"];
    //[cell setPhotoImage: [UIImage imageNamed:@"photo_default.jpeg"]];
    //[cell addSubview:labelCellText];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[[syxDetailViewController alloc] initWithNibName:@"syxDetailViewController" bundle:nil] autorelease];
    }
    int row = indexPath.row;
    NSDictionary* cellDic = [self.allStaffArray objectAtIndex:row];
    [self.detailViewController setDetailItem:cellDic];
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
