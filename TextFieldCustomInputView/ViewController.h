//
//  ViewController.h
//  TextFieldCustomInputView
//
//  Created by Avinash Kashyap on 7/16/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UIToolbar *toolBar;
-(IBAction) fontBarButtonAction:(id)sender;
-(IBAction) colorBarButtonAction:(id)sender;
-(IBAction) textBarButtonAction:(id)sender;
-(IBAction) doneBarButtonAction:(id)sender;
@end

