//
//  StringView.m
//  DrawRectString
//
//  Created by 袁伟森 on 2019/3/22.
//  Copyright © 2019 袁伟森. All rights reserved.
//

#import "StringView.h"

@implementation StringView



-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    /* 颜色 */
    UIColor *magentaColor =
    [UIColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f];
    /* 在图形上下文中设置颜色 */
    [magentaColor set];
    
    UIFont *helveticaBold =
    [UIFont fontWithName:@"HelveticaNeue-Bold" size:40.0f];
    NSString *myString = @"Some String";
    
    [myString drawAtPoint:CGPointMake(40, 180) withFont:helveticaBold];
    
}


@end
