//
//  DetailViewController.h
//  AddressBook
//
//  Created by Leon on 12-11-11.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPContact.h"

@interface DetailViewController : BaseTableViewController

@property (strong, nonatomic) LPContact *contact;

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *chineseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *englishNameLabel;

@end
