//
//  LPViewController.m
//  AddressBook
//
//  Created by Leon on 12-11-11.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "LPViewController.h"

@interface LPViewController ()

@end

@implementation LPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = RGBCOLOR(240,240,240);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
