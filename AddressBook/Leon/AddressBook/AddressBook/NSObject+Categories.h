//
//  NSObject+Categories.h
//  AddressBook
//
//  Created by Leon on 12-11-18.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Categories)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end
