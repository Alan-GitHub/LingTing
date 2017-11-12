//
//  LTADStartMenuViewController.m
//  LingTing
//
//  Created by Alan.Turing on 17/11/11.
//  Copyright © 2017年 Alan.Turing. All rights reserved.
//

#import "LTADStartInterfaceViewController.h"
#import "LTMainClassViewController.h"
#import "LTPreviewWorksVC.h"

@interface LTADStartInterfaceViewController ()
@property (weak, nonatomic) IBOutlet UIButton *ADTimerBtn;
@property (retain, nonatomic) NSTimer *ADTimer;

@end

@implementation LTADStartInterfaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.ADTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(TimerExpire) userInfo:nil repeats:YES];
}

- (void) TimerExpire
{
    static int ADTime = 0.0;
    NSString* str = [NSString stringWithFormat:@"%d秒", ADTime];
    [self.ADTimerBtn setTitle:str forState:UIControlStateNormal];
    
    if (ADTime > 0) {
        
        ADTime--;
    }
    else{
        
        [self.ADTimer invalidate];
        [self enterMainProgram];
    }
}

- (void) enterMainProgram
{
//    LTPreviewWorksVC* previewWorksVC = [[LTPreviewWorksVC alloc] init];
//    
//    LTMainClassViewController* mainProgramVC = [[LTMainClassViewController alloc] initWithRootViewController:previewWorksVC];

    LTMainClassViewController* mainProgramVC = [[LTMainClassViewController alloc] init];
    
//    UIView* view1 = [[UIView alloc] init];
//    view1.frame = CGRectMake(0, 0, mainProgramVC.view.bounds.size.width - 100, mainProgramVC.view.bounds.size.height);
//    view1.alpha = 0.5;
//    view1.backgroundColor = [UIColor darkGrayColor];
//    [mainProgramVC.view addSubview:view1];
//    
//    UIView* view2 = [[UIView alloc] init];
//    view2.frame = CGRectMake(100, 0, mainProgramVC.view.bounds.size.width - 100, mainProgramVC.view.bounds.size.height);
//    view2.alpha = 0.5;
//    view2.backgroundColor = [UIColor blueColor];
//    [mainProgramVC.view addSubview:view2];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = mainProgramVC;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc
{
    self.ADTimer = nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
