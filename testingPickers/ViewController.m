//
//  ViewController.m
//  testingPickers
//
//  Created by Asdruval De Leon on 10/12/17.
//  Copyright © 2017 Asdruval De Leon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerNumbers;
@property (weak, nonatomic) IBOutlet UILabel *lblDisplay;
@property (weak, nonatomic) IBOutlet UIButton *btnSelect;

//Define the two numbers array
@property (strong, nonatomic) NSArray * pickerData;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initialize Data
    _pickerData = @[ @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"],
                     @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"],
                     @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"],
                     @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"],
                     @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"] ];
    
    // Connect data
    self.pickerNumbers.dataSource = self;
    self.pickerNumbers.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)selectBtnPressed:(id)sender {
    NSInteger row = [_pickerNumbers selectedRowInComponent:0];
    
    //fetch data
    NSString* selected = _pickerData[row];
    NSString* message = [[NSString alloc]initWithFormat:@"Your numbers are %@", selected];
    
    _lblDisplay.text = message;
}

#pragma mark PickerView DataSource
// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

// The number of rows of data
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

#pragma mark - Picker Delegate Methods
// The data to return for the row and component (column) that's being passed in
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[component][row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.

}

@end
