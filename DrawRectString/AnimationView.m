//
//  AnimationView.m
//  DrawRectString
//
//  Created by 袁伟森 on 2019/3/22.
//  Copyright © 2019 袁伟森. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    [self move];
    
    [self scale];
    
    [self rotate];
}

//旋转
-(void)rotate{
    /*首先创建路径。只是路径句柄。*/
    CGMutablePathRef path = CGPathCreateMutable();
    /*这是我们的矩形边界*/
    CGRect rectangle = CGRectMake(50, 100, 200, 300);
    /*缩放*/
//    CGAffineTransform transform = CGAffineTransformMakeRotation((45.0f * M_PI) / 180.0f);
//    /*将矩形添加到路径中*/
//        CGPathAddRect(path, &transform, rectangle);
    CGPathAddRect(path, NULL, rectangle);
    
    /*获取当前上下文的句柄*/
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
//    CGContextScaleCTM(currentContext, 0.5, 0.5);
    CGContextRotateCTM(currentContext, (45.0f * M_PI) / 180.0f);
    /*将路径添加到上下文*/
    CGContextAddPath(currentContext, path);
    /*将填充颜色设置为矢车菊蓝色*/
    [[UIColor redColor] setFill];
    /*将描边颜色设置为棕色*/
    [[UIColor blackColor] setStroke];
    /*设置线条宽度(笔画)为5 */
    CGContextSetLineWidth(currentContext, 5);
    /*在上下文中描边并填充路径*/
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    /*删除路径*/
    CGPathRelease(path);
    CGContextRestoreGState(currentContext);
}
//缩放
-(void)scale{
    /*首先创建路径。只是路径句柄。*/
    CGMutablePathRef path = CGPathCreateMutable();
    /*这是我们的矩形边界*/
    CGRect rectangle = CGRectMake(50, 100, 200, 300);
    /*缩放*/
//    CGAffineTransform transform = CGAffineTransformMakeScale(0.5f, 0.5f);
    /*将矩形添加到路径中*/
//    CGPathAddRect(path, &transform, rectangle);
    CGPathAddRect(path, NULL, rectangle);

    /*获取当前上下文的句柄*/
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextScaleCTM(currentContext, 0.5, 0.5);
    /*将路径添加到上下文*/
    CGContextAddPath(currentContext, path);
    /*将填充颜色设置为矢车菊蓝色*/
    [[UIColor redColor] setFill];
    /*将描边颜色设置为棕色*/
    [[UIColor blackColor] setStroke];
    /*设置线条宽度(笔画)为5 */
    CGContextSetLineWidth(currentContext, 5);
    /*在上下文中描边并填充路径*/
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    /*删除路径*/
    CGPathRelease(path);
    CGContextRestoreGState(currentContext);
}
//移动
-(void)move{
    /*首先创建路径。只是路径句柄。*/
    CGMutablePathRef path = CGPathCreateMutable();
    /*这是我们的矩形边界*/
    CGRect rectangele = CGRectMake(10, 10, 200, 300);
    /*我们想把矩形向右移动100个点，但要保持y的位置不变*/
//    CGAffineTransform transform = CGAffineTransformMakeTranslation(100, 50);
    /*将矩形添加到路径中*/
//    CGPathAddRect(path, &transform, rectangele);
    CGPathAddRect(path, NULL, rectangele);

    /*获取当前上下文的句柄*/
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextTranslateCTM(currentContext, 100.0f, 0.0f);
    /*将路径添加到上下文*/
    CGContextAddPath(currentContext, path);
    /*将填充颜色设置为矢车菊蓝色*/
    [[UIColor redColor] setFill];
    /*将描边颜色设置为棕色*/
    [[UIColor blackColor] setStroke];
    /*设置线条宽度(笔画)为5 */
    CGContextSetLineWidth(currentContext, 5);
    /*在上下文中描边并填充路径*/
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    /*删除路径*/
    CGPathRelease(path);
    CGContextRestoreGState(currentContext);
}
@end
