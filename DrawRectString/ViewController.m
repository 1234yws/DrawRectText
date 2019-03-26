//
//  ViewController.m
//  DrawRectString
//
//  Created by 袁伟森 on 2019/3/22.
//  Copyright © 2019 袁伟森. All rights reserved.
//

#import "ViewController.h"
#import "StringView.h"
#import "AnimationView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIView *iv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    AnimationView *sv = [[AnimationView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//
//    [self.view addSubview:sv];
    
    /* Start from top left corner */
//    [self animitionMove];
    
    [self animitionRotate];

}
- (void)animitionRotate{
    self.imgView.center = self.view.center;
    /* Begin the animation */
    [UIView beginAnimations:@"clockwiseAnimation" context:NULL];
    /* Make the animation 5 seconds long */
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(clockwiseRotationStopped:finished:context:)];
    /* Rotate the image view 90 degrees */
    self.imgView.transform =
    CGAffineTransformMakeRotation((90.0f * M_PI) / 180.0f);
    /* Commit the animation */
    [UIView commitAnimations];
}

- (void)clockwiseRotationStopped:(NSString *)paramAnimationID finished:(NSNumber *)paramFinished context:(void *)paramContext{
    
    [UIView beginAnimations:@"counterclockwiseAnimation" context:NULL];
    /* 5 seconds long */
    [UIView setAnimationDuration:5.0f];
    /* Back to original rotation */
    self.imgView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
    
    
}
- (void)animitionScale{
    /* Place the image view at the center
     of the view of this view controller */
    self.imgView.center = self.view.center;
    /* Make sure no translation is applied to this image view */
    self.imgView.transform = CGAffineTransformIdentity;
    /* Begin the animation */
    [UIView beginAnimations:nil context:NULL];
    /* Make the animation 5 seconds long */
    [UIView setAnimationDuration:5.0f];
    /* Make the image view twice as large in width and height */
    self.imgView.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
    /* Commit the animation */
    [UIView commitAnimations];
}


- (void)animitionMove{
    [self.imgView setFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
    [self.imgView setAlpha:1.0f];
    [UIView beginAnimations:
     @"xcodeImageViewAnimation" context:(__bridge void * _Nullable)(self.imgView)];
    /* 5 seconds animation */
    [UIView setAnimationDuration:5.0f];
    /* Receive animation delegates */ [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector: @selector(imageViewDidStop:finished:context:)];
    /* End at the bottom right corner */
    [self.imgView setFrame:CGRectMake(200.0f, 350.0f, 100.0f, 100.0f)];
    [self.imgView setAlpha:0.0f];
    [UIView commitAnimations];
}

- (void)imageViewDidStop:(NSString *) paramAnimationID finished:(NSNumber *)paramFinished context:(void *)paramContext { NSLog(@"Animation finished.");
    NSLog(@"Animation ID = %@", paramAnimationID);
    UIImageView *contextImageView = (__bridge UIImageView *)paramContext;
    NSLog(@"Image View = %@", contextImageView);
    [contextImageView removeFromSuperview];
    
}
@end
