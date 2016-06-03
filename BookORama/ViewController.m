//
//  ViewController.m
//  BookORama
//
//  Created by Aditya Narayan on 6/3/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import "ViewController.h"
#define MIDDLE_VIEW_X CGRectGetMidX(self.view.bounds)
#define MIDDLE_VIEW_Y CGRectGetMidY(self.view.bounds)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *viewButton;

@property (weak, nonatomic) IBOutlet UIImageView *bookORamaLogo;
@property (weak, nonatomic) IBOutlet UIStackView *homeStackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewButton.layer.zPosition = 10;
    [self spinAndMoveStackView];
    [self addGestureWithAnimationToImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)viewLibrary:(id)sender {
    [self performSegueWithIdentifier:@"viewLibrary" sender:nil];
}

- (void) spinAndMoveStackView {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue           = @(M_PI * 2.0); /* full rotation*/
    
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-10,-10)];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(MIDDLE_VIEW_X,MIDDLE_VIEW_Y)];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations        = @[rotationAnimation, moveAnimation];
    animationGroup.duration          = 3.0;
    animationGroup.repeatCount       = 1.0;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animationGroup.fillMode = kCAFillModeForwards;
    
    animationGroup.removedOnCompletion = YES;
    
    [self.homeStackView.layer addAnimation:animationGroup forKey:@"spinAndMoveStack"];
}

- (void) addGestureWithAnimationToImage {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(spinBird)];
    tapGesture.numberOfTapsRequired = 1;
    [self.bookORamaLogo addGestureRecognizer:tapGesture];
}

- (void)spinBird {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue        = @(M_PI * 4.0); /* 2 full rotations*/
    rotationAnimation.duration       = 1.0;
    rotationAnimation.repeatCount    = 2.0;
    
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.bookORamaLogo.layer addAnimation:rotationAnimation forKey:@"spinTheBird"];
}

@end