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
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    [self drawRectText];
//    [self drawRectIamge];
//    [self drawRectLine];
   
//    [self drawRooftopAtTopPointof:CGPointMake(160.0f, 80.0f) textToDisplay:@"Miter"
//                         lineJoin:kCGLineJoinMiter];
//    [self drawRooftopAtTopPointof:CGPointMake(160.0f, 220.0f) textToDisplay:@"Bevel"
//                         lineJoin:kCGLineJoinBevel];
//    [self drawRooftopAtTopPointof:CGPointMake(160.0f, 360.0f) textToDisplay:@"Round"
//                         lineJoin:kCGLineJoinRound];
    
//    [self drawRectX];
    
//    [self drawRectRectangle];
    
//    [self drawRectShadow];
//    [self drawRectAtBottomOfScreen];
    
    [self drawRectGradient];
}


//绘制渐变
-(void)drawRectGradient{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    UIColor *startColor = [UIColor orangeColor]; CGFloat *startColorComponents =
    (CGFloat *)CGColorGetComponents([startColor CGColor]); UIColor *endColor = [UIColor blueColor];
    CGFloat *endColorComponents =
    (CGFloat *)CGColorGetComponents([endColor CGColor]);
    CGFloat colorComponents[8] = {
        /* Four components of the orange color (RGBA) */ startColorComponents[0],
        startColorComponents[1],
        startColorComponents[2],
        startColorComponents[3], /* First color = orange */
        /* Four components of the blue color (RGBA) */ endColorComponents[0],
        endColorComponents[1],
        endColorComponents[2],
        endColorComponents[3], /* Second color = blue */ };
    CGFloat colorIndices[2] = {
        0.0f, /* Color 0 in the colorComponents array */ 1.0f, /* Color 1 in the colorComponents array */ };
    CGGradientRef gradient = CGGradientCreateWithColorComponents (colorSpace, (const CGFloat *)&colorComponents,
                                                                  (const CGFloat *)&colorIndices, 2);
    CGColorSpaceRelease(colorSpace);
    CGPoint startPoint, endPoint; startPoint = CGPointMake(120, 260); endPoint = CGPointMake(200.0f, 220);
    CGContextDrawLinearGradient (currentContext, gradient, startPoint, endPoint,kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient);
    CGContextRestoreGState(currentContext);
}

//添加一个阴影
-(void)drawRectShadow{
    /*获取当前上下文的句柄*/
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    /*首先创建路径。只是路径句柄。*/
    //
    CGContextSetShadowWithColor(currentContext, CGSizeMake(10.0f, 10.0f), 20.0f, [[UIColor grayColor] CGColor]);
    /*这是我们的矩形边界*/
    CGMutablePathRef path = CGPathCreateMutable();
    /*设置矩形边界*/
    CGRect firstRect = CGRectMake(55.0f, 60.0f, 150.0f, 150.0f);
    /*将矩形添加到路径中*/
    CGPathAddRect(path, NULL, firstRect);
    /*将路径添加到上下文*/
    CGContextAddPath(currentContext, path);
    /*将填充颜色设置为矢车菊蓝色*/
    [[UIColor orangeColor] setFill];
    /*填充上下文上的路径*/
    CGContextDrawPath(currentContext, kCGPathFill);
    /*删除路径*/
    CGPathRelease(path);
    
    
}

- (void) drawRectAtBottomOfScreen{
    /* Get the handle to the current context */
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGMutablePathRef secondPath = CGPathCreateMutable();
    CGRect secondRect = CGRectMake(150.0f, 250.0f, 100.0f, 100.0f);
    CGPathAddRect(secondPath, NULL, secondRect);
    CGContextAddPath(currentContext, secondPath);
    [[UIColor purpleColor] setFill];
    CGContextDrawPath(currentContext, kCGPathFill);
    CGPathRelease(secondPath);
    
    
    
}
//画一个矩形
-(void)drawRectRectangle{
    /*首先创建路径。只是路径句柄。*/
    CGMutablePathRef path = CGPathCreateMutable();
    /*这是我们的矩形边界*/
    CGRect rectangle1 = CGRectMake(40, 40, 300, 200);
    CGRect rectangle2 = CGRectMake(80.0f, 100.0f, 90.0f, 300.0f);
    /*将两个矩形放入数组*/
    CGRect rectangles[2] = {rectangle1, rectangle2 };
    /*将矩形添加到路径中*/
//    CGPathAddRect(path, NULL, rectangle1);
    CGPathAddRects(path, NULL, (const CGRect *)&rectangles, 2);
    /*获取当前上下文的句柄*/
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    /*将路径添加到上下文*/
    CGContextAddPath(currentContext, path);
    /*设置填充颜色*/
    [[UIColor redColor] setFill];
    /*设置描边颜色*/
    [[UIColor blueColor] setStroke];
    /*设置线条宽度(笔画)为5 */
    CGContextSetLineWidth(currentContext, 5);
    /*在上下文中描边并填充路径*/
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    /*删除路径*/
    CGPathRelease(path);
}
//构造路径
-(void)drawRectX{
    //创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    //我们的屏幕有多大?我们想让X覆盖整个屏幕
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    //从左上的开始
    CGPathMoveToPoint(path, NULL, screenBounds.origin.x, screenBounds.origin.y);
    //从屏幕的左上角到右下角画一条线
    CGPathAddLineToPoint(path, NULL, screenBounds.size.width, screenBounds.size.height);
    //从右上角开始另一行
    CGPathMoveToPoint(path, NULL,screenBounds.size.width, screenBounds.origin.y);
    //从右上角到左下角画一条线
    CGPathAddLineToPoint(path, NULL, screenBounds.origin.x, screenBounds.size.height);
    //获取路径必须绘制的上下文
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //将路径添加到上下文中，以便稍后绘制
    CGContextAddPath(currentContext, path);
    //将蓝色设置为描边颜色
    [[UIColor blueColor] setStroke];
    //用描边颜色绘制路径
    CGContextDrawPath(currentContext, kCGPathStroke);
    //最后释放path对象
    CGPathRelease(path);
}

- (void) drawRooftopAtTopPointof:(CGPoint)paramTopPoint textToDisplay:(NSString *)paramText lineJoin:(CGLineJoin)paramLineJoin {
    /* Set the color that we want to use to draw the line */
    [[UIColor brownColor] set];
    /* Get the current graphics context */
    CGContextRef currentContext =
    UIGraphicsGetCurrentContext();
    /* Set the line join */
    CGContextSetLineJoin(currentContext, paramLineJoin);
    /* Set the width for the lines */
    CGContextSetLineWidth(currentContext, 20.0f);
    /* Start the line at this point */
    CGContextMoveToPoint(currentContext, paramTopPoint.x - 140,
                                                            paramTopPoint.y + 100);
    /* And end it at this point */
    CGContextAddLineToPoint(currentContext,
                                                           paramTopPoint.x, paramTopPoint.y);
    /* Extend the line to another point to make the rooftop */
    CGContextAddLineToPoint(currentContext,
                                                                                       paramTopPoint.x + 140,
                                                                                       paramTopPoint.y + 100);
    /* Use the context's current color to draw the lines */
    CGContextStrokePath(currentContext);
    /* Draw the text in the rooftop using a black color */
    [[UIColor blackColor] set];
    /* Now draw the text */
    [paramText drawAtPoint:
                             CGPointMake(paramTopPoint.x - 40.0f, paramTopPoint.y + 60.0f) withFont:[UIFont boldSystemFontOfSize:30.0f]];
    
    
}

//绘制线条
-(void)drawRectLine{
    [[UIColor redColor] set];
    //获取当前图形上下文
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //设置线条的宽度
    CGContextSetLineWidth(currentContext, 10);
    //设置起点
    CGContextMoveToPoint(currentContext, 50.0f, 100.0f);
    //设置终点
    CGContextAddLineToPoint(currentContext, 100.0f, 400.0f);
    //继续添加画点
    CGContextAddLineToPoint(currentContext, 300.0f, 100.0f);
    CGContextAddLineToPoint(currentContext, 300.0f, 400.0f);
    
    
    //两条直线相交的点，称为连接
    //kCGLineJoinMiter,尖角（默认）
    //kCGLineJoinRound,圆形
    //kCGLineJoinBevel,平角
    CGContextSetLineJoin(currentContext, kCGLineJoinBevel);
    //使用上下文的当前颜色来绘制线条
    CGContextStrokePath(currentContext);
    
    
}

//绘制文字
-(void)drawRectText{
    // 颜色
    UIColor *magentaColor =
    [UIColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f];
    // 在图形上下文中设置颜色
    [magentaColor set];
    
    UIFont *helveticaBold =
    [UIFont fontWithName:@"HelveticaNeue-Bold" size:40.0f];
    NSString *myString = @"Some String";
    
    // 使用字体绘制字符串。颜色已经设置好了
    //    [myString drawAtPoint:CGPointMake(40, 180) withFont:helveticaBold];
    
    CGRect rects = CGRectMake(100, 120, 100, 200);
    
    [myString drawInRect:rects withFont:helveticaBold];
}
//绘制图片
-(void)drawRectIamge{
    //绘制图片
    UIImage *xcodeIcon = [UIImage imageNamed:@"ImageIcon.png"];
    //绘制完整的图片
    [xcodeIcon drawAtPoint:CGPointMake(50.0f, 90.0f)];
    //绘制图片，并且限定大小
    [xcodeIcon drawInRect:CGRectMake(50.0f, 10.0f, 40.0f, 35.0f)];
}

@end
