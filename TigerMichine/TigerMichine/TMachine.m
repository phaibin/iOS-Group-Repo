
#import "TMachine.h"

@interface TMachine(privateMethod)

@end

@implementation TMachine

@synthesize grade;

@synthesize prize;

@synthesize bingoTotal;

- (BOOL) isWin
{
    if (bingoTotal < 3)
    {
        return NO;
    }

    [self config];

    return YES;
}

- (void) config
{
    if (bingoTotal == 3) 
    {
        self.grade = @"三等奖";
        self.prize = @"ipod nano";
        
    }
    if (bingoTotal == 4) 
    {
        self.grade = @"二等奖";
        self.prize = @"ipod touch";
    }
    
    if (bingoTotal == 5)
    {
        self.grade = @"一等奖";
        self.prize = @"iphone 4s";
    }
}

- (NSString *) prizeDescription
{
    return [NSString stringWithFormat:@"恭喜您中了%@,获得的礼品是%@", self.grade, self.prize];
}
@end
