//
//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    Version 2, December 2004
//
//    Copyright (C) 2016 KIM TAE JUN <korean.darren@gmail.com>
//
//    Everyone is permitted to copy and distribute verbatim or modified
//    copies of this license document, and changing it is allowed as long
//    as the name is changed.
//
//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//    0. You just DO WHAT THE FUCK YOU WANT TO.
//

#import "DRNMainViewController.h"

// Utility
#import "UITextField+Max.h"

@interface DRNMainViewController ()

@property (strong, nonnull) UITextField *textField;

@end

@implementation DRNMainViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat contentWidth = CGRectGetWidth(self.view.frame) - 20.0f;
    
    // Initialize text field.
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, contentWidth, 50)];
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.textColor = [UIColor darkGrayColor];
    _textField.clipsToBounds = YES;
    _textField.layer.cornerRadius = 5.0f;
    _textField.layer.borderWidth = 1.0f;
    _textField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _textField.maxLength = 5;
    
    // Set the left view to make left-inset to text field.
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(.0f, .0f, 20.0f, .0f)];
    _textField.leftView = leftView;
    _textField.leftViewMode = UITextFieldViewModeAlways;
    
    // Add text field to self.view
    [self.view addSubview:_textField];
    
    // Initialize title label for segmented control.
    UILabel *countTitleLabel = [[UILabel alloc] init];
    countTitleLabel.frame = CGRectMake(10.0f, 120.0f, contentWidth, 12.0f);
    countTitleLabel.font = [UIFont boldSystemFontOfSize:11.0f];
    countTitleLabel.textColor = [UIColor lightGrayColor];
    countTitleLabel.text = @"Set the MAX length";
    [self.view addSubview:countTitleLabel];
    
    // Initialize segmented control that will control the max length of text field.
    UISegmentedControl *countSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"5", @"10", @"15", @"20"]];
    countSegmentedControl.frame = CGRectMake(10, 140.0f, contentWidth, 40.0f);
    countSegmentedControl.tintColor = [UIColor darkGrayColor];
    [countSegmentedControl addTarget:self
                              action:@selector(segmentedControlValueChanged:)
                    forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:countSegmentedControl];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_textField becomeFirstResponder];
}

#pragma mark - Action

- (void)segmentedControlValueChanged:(UISegmentedControl *)segmentedControl
{
    // You can set the MAX LENGTH to the text field with just a line of code.
    _textField.maxLength = (segmentedControl.selectedSegmentIndex + 1) * 5;
}

@end
