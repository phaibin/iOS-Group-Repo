//
//  AboutViewController.h
//  AddressBook
//
//  Created by Leon on 12-11-17.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : BaseTableViewController

@property (weak, nonatomic) IBOutlet PrettyTableViewCell *versionCell;
@property (weak, nonatomic) IBOutlet PrettyTableViewCell *descCell;

@end
