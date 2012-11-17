//
//  LPContactCell.h
//  AddressBook
//
//  Created by Leon on 12-11-16.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrettyTableViewCell.h"

@interface LPContactCell : PrettyTableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *emailLabel;
@property (nonatomic, weak) IBOutlet UILabel *mobileLabel;

@end
