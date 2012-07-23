
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "TMachine.h"


@interface TMViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIPickerView *tigerMichinePicker;

    NSArray *column1;

    NSArray *column2;

    NSArray *column3;

    NSArray *column4;

    NSArray *column5;

    TMachine *machine;
}


@property(nonatomic, retain) IBOutlet UIPickerView *tigerMichinePicker;

@property(nonatomic, retain) NSArray *column1;

@property(nonatomic, retain) NSArray *column2;

@property(nonatomic, retain) NSArray *column3;

@property(nonatomic, retain) NSArray *column4;

@property(nonatomic, retain) NSArray *column5;

@property(nonatomic, retain) TMachine *machine;

- (IBAction) spain;

@end
