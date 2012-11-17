//
//  DetailViewController.h
//  AddressBook
//
//  Created by Leon on 12-11-11.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
