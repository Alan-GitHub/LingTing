//
//  LTPreviewWorksVC.m
//  LingTing
//
//  Created by Alan.Turing on 17/11/12.
//  Copyright © 2017年 Alan.Turing. All rights reserved.
//

#import "LTPreviewWorksVC.h"
#import "LTCommon.h"

@interface LTPreviewWorksVC ()

@end

@implementation LTPreviewWorksVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupNavigationItem];
    
    self.view.alpha = 0.5;
    self.view.backgroundColor = [UIColor blueColor];
}

- (void) setupNavigationItem
{
    self.navigationItem.title = @"聆听";
    
    [self setupLeftNavigationItem];
    
}

- (void) setupLeftNavigationItem
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
