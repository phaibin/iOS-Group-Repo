//
//  StaffCell.h
//  AddressBook
//
//  Created by shi jack on 12-9-27.
//  Copyright (c) 2012年 jje. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffCell : UITableViewCell {
    UIImageView* photoImageView;
    UILabel* nameLabel;
    UILabel* enNameLabel;
}

-(void)setDicData:(NSDictionary*)dicData;

@end
