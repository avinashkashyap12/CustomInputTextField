//
//  CustomColorSelectionView.m
//  TextFieldCustomInputView
//
//  Created by Avinash Kashyap on 7/16/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import "CustomColorSelectionView.h"

@implementation CustomColorSelectionView

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
    
    colorListArray = @[[UIColor redColor],[UIColor yellowColor],[UIColor cyanColor],[UIColor orangeColor],[UIColor blueColor],[UIColor magentaColor],[UIColor purpleColor],[UIColor lightGrayColor],[UIColor grayColor],[UIColor darkGrayColor],[UIColor blackColor]];
    
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    [flowLayOut setItemSize:CGSizeMake(100, 100)];
    colorListCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayOut];
    [colorListCollectionView setDataSource:self];
    [colorListCollectionView setDelegate:self];
    colorListCollectionView.backgroundColor = [UIColor whiteColor];
    [colorListCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self addSubview:colorListCollectionView];
    colorListCollectionView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
}
#pragma mark -
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return colorListArray.count;
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.backgroundColor=[colorListArray objectAtIndex:indexPath.row];
    return cell;
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.colorDelegate && [self.colorDelegate respondsToSelector:@selector(didSelectTextColor:)]) {
        [self.colorDelegate didSelectTextColor:[colorListArray objectAtIndex:indexPath.row]];
    }
}
@end
