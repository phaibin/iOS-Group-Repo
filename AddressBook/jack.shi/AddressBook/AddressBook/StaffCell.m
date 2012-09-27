//
//  StaffCell.m
//  AddressBook
//
//  Created by shi jack on 12-9-27.
//  Copyright (c) 2012年 jje. All rights reserved.
//

#import "StaffCell.h"

@implementation StaffCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        //[self setPhotoImage: [UIImage imageNamed:@"photo_default.jpeg"]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected == YES) {
        photoImageView.alpha =1;
    }else{
        photoImageView.alpha =.8;
    }
}

-(void)setDicData:(NSDictionary*)dicData {
    NSLog(@"%@", dicData);
    NSString* secondName = [dicData objectForKey:@"名"];
    NSString* firstName = [dicData objectForKey:@"姓"];
    NSString* enName = [dicData objectForKey:@"英文称谓"];
    NSString* photoPath = [dicData objectForKey:@"小头像"];
    if (photoPath == nil) {
        photoPath = @"photo_default.jpeg";
    }
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 5, 300, 20)];
    nameLabel.text = [[NSString alloc]initWithFormat:@"%@%@", firstName, secondName];
    [self.contentView addSubview:nameLabel];
    enNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 25, 300, 20)];
    enNameLabel.text = [[NSString alloc]initWithFormat:@"%@", enName];
    enNameLabel.font = [UIFont fontWithName:@"楷体" size:12];
    [self.contentView addSubview:enNameLabel];
    photoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:photoPath]];
    photoImageView.frame = CGRectMake(5, 5, 50, 50);
    [self.contentView addSubview:photoImageView];
}

@end
