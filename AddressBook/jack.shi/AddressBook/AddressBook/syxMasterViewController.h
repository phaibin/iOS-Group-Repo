//
//  syxMasterViewController.h
//  AddressBook
//
//  Created by shi jack on 12-9-27.
//  Copyright (c) 2012年 jje. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaffCell.h"
@class syxDetailViewController;

@interface syxMasterViewController : UITableViewController {

}

@property (strong, nonatomic) syxDetailViewController *detailViewController;
@property (retain, nonatomic) NSArray* allStaffArray;
@end
