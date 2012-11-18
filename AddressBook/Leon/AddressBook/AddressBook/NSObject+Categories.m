//
//  NSObject+Categories.m
//  AddressBook
//
//  Created by Leon on 12-11-18.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "NSObject+Categories.h"

@implementation NSObject (Categories)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    block = [block copy];
    [self performSelector:@selector(fireBlockAfterDelay:)
               withObject:block
               afterDelay:delay];
}

- (void)fireBlockAfterDelay:(void (^)(void))block {
    block();
}

@end
