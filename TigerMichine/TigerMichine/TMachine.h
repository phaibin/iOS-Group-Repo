#import <UIKit/UIKit.h>

@interface TMachine : NSObject
{
    NSString *grade;

    NSString *prize;

    int bingoTotal;
}

@property (nonatomic, retain) NSString *grade;

@property (nonatomic, retain) NSString *prize;

@property int bingoTotal;

- (BOOL) isWin;

- (NSString *) prizeDescription;

@end
