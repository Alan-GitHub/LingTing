//
//  LTMainClassViewController.m
//  LingTing
//
//  Created by Alan.Turing on 17/11/11.
//  Copyright © 2017年 Alan.Turing. All rights reserved.
//

#import "LTMainClassViewController.h"
#import "LTPreviewWorksVC.h"
#import "LTLeftViewController.h"
#import "LTRightViewController.h"
#import "LTCommon.h"

@interface LTMainClassViewController ()
@property(retain, nonatomic) LTLeftViewController *leftVC;
@property(retain, nonatomic) LTRightViewController *rightVC;
@property(retain, nonatomic) UINavigationController *pwNC;


@end

@implementation LTMainClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor brownColor];

    [self setStructs];
    
    [self addTapGestureOnPreviewWorksVC];
}

- (void) setStructs
{
    //Left Controller
    self.leftVC = [[LTLeftViewController alloc] init];
    self.leftVC.view.frame = CGRectMake(0, 0, leftRightVCWidth, ScreenH);
    [self addChildViewController:self.leftVC];
    [self.view addSubview:self.leftVC.view];
    

    //Right Controller
    #if isRightNavigationItemButton
    self.rightVC = [[LTRightViewController alloc] init];
    self.rightVC.view.frame = CGRectMake(ScreenW - leftRightVCWidth, 0, leftRightVCWidth, ScreenH);
    [self addChildViewController:self.rightVC];
    [self.view addSubview:self.rightVC.view];
    #endif
    
    //Center Controller
    LTPreviewWorksVC* pwVC = [[LTPreviewWorksVC alloc] init];
    self.pwNC = [[UINavigationController alloc] initWithRootViewController:pwVC];
    self.pwNC.view.frame = [UIScreen mainScreen].bounds;
    [self addChildViewController:self.pwNC];
    [self.view addSubview:self.pwNC.view];
    
//    //add navigation left item.
//    UIButton* leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    leftBtn.frame = CGRectMake(0, 7, 50, 30);
//    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [leftBtn setTitle:@"左边" forState:UIControlStateNormal];
//    [leftBtn addTarget:self action:@selector(clickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
//    pwVC.navigationItem.leftBarButtonItem = leftItem;
//    
//    //add navigation right item.
//    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    rightBtn.frame = CGRectMake(0, 7, 50, 30);
//    [rightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [rightBtn setTitle:@"右边" forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    pwVC.navigationItem.rightBarButtonItem = rightItem;
    
    pwVC.navigationItem.leftBarButtonItem = ({
        UIBarButtonItem *leftB = [[UIBarButtonItem alloc] initWithTitle:@"左边" style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction:)];
        leftB;
    });
    
    #if isRightNavigationItemButton
    pwVC.navigationItem.rightBarButtonItem = ({
        UIBarButtonItem *rightB = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightAction:)];
        rightB;
    });
    #endif
}

- (void) addTapGestureOnPreviewWorksVC
{
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEventOnPreviewWorksVC)];
    [self.childViewControllers.lastObject.view addGestureRecognizer:tap];

}

- (void) tapEventOnPreviewWorksVC
{
     if (self.pwNC.view.center.x != self.view.center.x)
     {
         if (self.pwNC.view.center.x > self.view.center.x) {
             
             [self leftAction:nil];
         }
         #if isRightNavigationItemButton
         else if (self.pwNC.view.center.x < self.view.center.x){
             
             [self rightAction:nil];
         }
         #endif
     }
}


//- (void) clickLeftBtn
//{
//    NSLog(@"clickLeftBtn");
//}
//
//- (void) clickRightBtn
//{
//    NSLog(@"clickRightBtn");
//}

/**
 *  左边按钮事件: rightVC 和 centerNC 向右偏移
 */
- (void)leftAction:(UIBarButtonItem *)sender {
    
//    UINavigationController *pwNC = self.childViewControllers.lastObject;
//    LTRightViewController *rightVC = self.childViewControllers[1];
//    LTLeftViewController *leftVC = self.childViewControllers.firstObject;
    [UIView animateWithDuration:0.5 animations:^{

        if (self.pwNC.view.center.x != self.view.center.x) {
            
            self.leftVC.view.frame = CGRectMake(0, 0, leftRightVCWidth, ScreenH);
            self.rightVC.view.frame = CGRectMake(ScreenW - leftRightVCWidth, 0, leftRightVCWidth, ScreenH);
            self.pwNC.view.frame = [UIScreen mainScreen].bounds;
            
        }else{
            
            self.pwNC.view.frame = CGRectMake(leftRightVCWidth, 0, ScreenW, ScreenH);
            self.rightVC.view.frame = CGRectMake(leftRightVCWidth, 0, ScreenW, ScreenH);
        }
    }];
}


/**
 * 右边按钮事件: leftVC 和 centerNC 向左偏移
 */
#if isRightNavigationItemButton
- (void)rightAction:(UIBarButtonItem *)sender {
//    UINavigationController *pwNC = self.childViewControllers.lastObject;
//    LTLeftViewController *leftVC = self.childViewControllers.firstObject;
//    LTRightViewController *rightVC = self.childViewControllers[1];
    [UIView animateWithDuration:0.5 animations:^{
        
        if (self.pwNC.view.center.x != self.view.center.x) {
            
            self.leftVC.view.frame = CGRectMake(0, 0, leftRightVCWidth, ScreenH);
            self.rightVC.view.frame = CGRectMake(ScreenW - leftRightVCWidth, 0, leftRightVCWidth, ScreenH);
            self.pwNC.view.frame = [UIScreen mainScreen].bounds;
            
        }else{
            
            self.pwNC.view.frame = CGRectMake(-leftRightVCWidth, 0, ScreenW, ScreenH);
            self.leftVC.view.frame =CGRectMake(-leftRightVCWidth, 0, leftRightVCWidth, ScreenH);
        }
    }];
}
#endif

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
