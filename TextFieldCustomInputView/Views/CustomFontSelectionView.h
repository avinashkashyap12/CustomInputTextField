//
//  CustomFontSelectionView.h
//  TextFieldCustomInputView
//
//  Created by Avinash Kashyap on 7/16/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FontSelectionDelegate <NSObject>

-(void) didSelectFontSize:(NSNumber *)fontSize;

@end

@interface CustomFontSelectionView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIPickerView *pickerView;
    NSArray *fontListArray;
}
@property (nonatomic, weak) id <FontSelectionDelegate> fontDelegate;
@end
