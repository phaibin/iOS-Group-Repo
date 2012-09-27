//
//  syxDetailViewController.h
//  AddressBook
//
//  Created by shi jack on 12-9-27.
//  Copyright (c) 2012年 jje. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface syxDetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary* detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
