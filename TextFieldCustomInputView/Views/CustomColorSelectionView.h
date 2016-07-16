//
//  CustomColorSelectionView.h
//  TextFieldCustomInputView
//
//  Created by Avinash Kashyap on 7/16/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorSelectionDelegate <NSObject>

-(void) didSelectTextColor:(UIColor *)color;

@end
@interface CustomColorSelectionView : UIView<UICollectionViewDelegate, UICollectionViewDataSource>
{
    UICollectionView *colorListCollectionView;
    NSArray *colorListArray;
}
@property (nonatomic, weak) id <ColorSelectionDelegate> colorDelegate;
@end
