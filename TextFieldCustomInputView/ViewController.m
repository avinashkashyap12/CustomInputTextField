//
//  ViewController.m
//  TextFieldCustomInputView
//
//  Created by Avinash Kashyap on 7/16/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import "ViewController.h"
#import "CustomFontSelectionView.h"
#import "CustomColorSelectionView.h"

@interface ViewController ()<FontSelectionDelegate,ColorSelectionDelegate>
{
    CGFloat height;
    CustomFontSelectionView *customFontSelectionView;
    CustomColorSelectionView *customColorSelectionView;
}
@end

@implementation ViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    [self.textField becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //set border
    self.textField.layer.borderColor = [UIColor blackColor].CGColor;
    self.textField.layer.borderWidth = 0.7;
    //set corner radius
    self.textField.layer.cornerRadius = 2;
    self.textField.clipsToBounds = YES;
    //set left view
    self.textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 40)];
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    
    self.textField.inputAccessoryView = self.toolBar;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
- (void)keyboardWillChange:(NSNotification *)notification {
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameEnd = [keyboardInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    NSLog(@"value = %@",keyboardFrameEnd);
    CGRect frame = keyboardFrameEnd.CGRectValue;
    height = frame.size.height;
}

#pragma mark -
-(void) displayFontSelectionView{
    [self.textField resignFirstResponder];
    if (!customFontSelectionView) {
        customFontSelectionView = [[CustomFontSelectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, height)];
    }
    customFontSelectionView.fontDelegate = self;
    self.textField.inputView = customFontSelectionView;
    [self.textField becomeFirstResponder];
}
-(void) didSelectFontSize:(NSNumber *)fontSize{
    self.textField.font = [UIFont systemFontOfSize:[fontSize integerValue]];
}
#pragma mark -
-(void) displayColorSelectionView{
    [self.textField resignFirstResponder];
    if (!customColorSelectionView) {
        customColorSelectionView = [[CustomColorSelectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, height)];
        
    }
    customColorSelectionView.colorDelegate = self;
    self.textField.inputView = customColorSelectionView;
    [self.textField becomeFirstResponder];
}
-(void) didSelectTextColor:(UIColor *)color{
    self.textField.textColor = color;
    self.textField.layer.borderColor = color.CGColor;
}
#pragma mark -
-(IBAction) fontBarButtonAction:(id)sender{
    [self displayFontSelectionView];
}

-(IBAction) colorBarButtonAction:(id)sender{
    [self displayColorSelectionView];
}
-(IBAction) textBarButtonAction:(id)sender{
    [self.textField resignFirstResponder];
    self.textField.inputView = nil;
    self.textField.keyboardType = UIKeyboardTypeDefault;
    [self.textField becomeFirstResponder];
    
}
-(IBAction) doneBarButtonAction:(id)sender{
    [self.view endEditing:YES];
}
@end
