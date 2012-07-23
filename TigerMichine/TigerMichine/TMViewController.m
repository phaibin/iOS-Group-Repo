
#import "TMViewController.h"

@interface TMViewController ()

@end

@implementation TMViewController

@synthesize tigerMichinePicker;

@synthesize column1;

@synthesize column2;

@synthesize column3;

@synthesize column4;

@synthesize column5;

@synthesize machine;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    machine = [[TMachine alloc] init];
    UIImage *apple = [UIImage imageNamed:@"apple.png"];
    UIImage *bar = [UIImage imageNamed:@"bar.png"];
    UIImage *cherry = [UIImage imageNamed:@"cherry.png"];
    UIImage *crown = [UIImage imageNamed:@"crown.png"];
    UIImage *lemon = [UIImage imageNamed:@"lemon.png"];
    UIImage *seven = [UIImage imageNamed:@"seven.png"];
    
    for (int i = 1; i <= 5; i++) {
        UIImageView *appleView = [[UIImageView alloc] initWithImage:apple];
        UIImageView *barView = [[UIImageView alloc] initWithImage:bar];
        UIImageView *cherryView = [[UIImageView alloc] initWithImage:cherry];
        UIImageView *crownView = [[UIImageView alloc] initWithImage:crown];
        UIImageView *lemonView = [[UIImageView alloc] initWithImage:lemon];
        UIImageView *sevenView = [[UIImageView alloc] initWithImage:seven];
        
        NSArray *imageViewArray = [[NSArray alloc] initWithObjects:appleView, barView, cherryView, crownView, lemonView, sevenView, nil];
        
        NSString *filedName = [[NSString alloc] initWithFormat:@"column%d", i];
        
        [self setValue:imageViewArray forKey:filedName];
        [appleView release];
        [barView release];
        [cherryView release];
        [crownView release];
        [lemonView release];
        [sevenView release];
        
        [imageViewArray release];
    }
    
    srandom(time(NULL));
    
}

- (IBAction)spain
{
    int lastVal = -1;
    
    for (int i = 0; i < 5; i++) {
        int newVal = random() % [self.column1 count];
        
        if (newVal == lastVal) {
            machine.bingoTotal++;
        } else {
            machine.bingoTotal = 1;
        }
        
        lastVal = newVal;
        
        [tigerMichinePicker selectRow:newVal inComponent:i animated:YES];
        [tigerMichinePicker reloadComponent:i];
        
        [self playSound:@"crunch"];
    }

    if ([machine isWin])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"中奖通知" message:[machine prizeDescription] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];

        [self playSound:@"win"];
    }
}

- (void)playSound:(NSString *)soundName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:soundName
                                                     ofType:@"wav"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID(
                                     (__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
    AudioServicesPlaySystemSound (soundID);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.column1 count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}

#pragma mark Picker Delegate Methods
- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view {
    NSString *arrayName = [[NSString alloc] initWithFormat:@"column%d",
                           component+1];
    NSArray *array = [self valueForKey:arrayName];
    return [array objectAtIndex:row];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    tigerMichinePicker = nil;
    column1 = nil;
    column2 = nil;
    column3 = nil;
    column4 = nil;
    column5 = nil;
}

- (void) dealloc
{
    [tigerMichinePicker release];
    [column1 release];
    [column2 release];
    [column3 release];
    [column4 release];
    [column5 release];
    [super dealloc];
}
@end
