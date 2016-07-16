//
//  CustomFontSelectionView.m
//  TextFieldCustomInputView
//
//  Created by Avinash Kashyap on 7/16/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import "CustomFontSelectionView.h"

@implementation CustomFontSelectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}
-(void) initialize{
    fontListArray = @[[NSNumber numberWithInteger:10],[NSNumber numberWithInteger:11],[NSNumber numberWithInteger:12],[NSNumber numberWithInteger:13],[NSNumber numberWithInteger:14],[NSNumber numberWithInteger:15],[NSNumber numberWithInteger:16],[NSNumber numberWithInteger:17],[NSNumber numberWithInteger:18],[NSNumber numberWithInteger:19],[NSNumber numberWithInteger:20],[NSNumber numberWithInteger:21],[NSNumber numberWithInteger:22],[NSNumber numberWithInteger:23],[NSNumber numberWithInteger:24],[NSNumber numberWithInteger:25]];
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [self addSubview:pickerView];
}
#pragma mark -
#pragma mark Picker View DataSource
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return fontListArray.count;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
#pragma mark Picker View Delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%@",[fontListArray objectAtIndex:row]];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //send delegate to update text with selected font size 
    if (self.fontDelegate && [self.fontDelegate respondsToSelector:@selector(didSelectFontSize:)]) {
        [self.fontDelegate didSelectFontSize:[fontListArray objectAtIndex:row]];
    }
}
#pragma mark -
-(BOOL)enableInputClicksWhenVisible{
    return YES;
}
@end
