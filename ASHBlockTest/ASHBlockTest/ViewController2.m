//
//  ViewController2.m
//  ASHBlockTest
//
//  Created by xmfish on 16/11/28.
//  Copyright © 2016年 ash. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"第二页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* btn1 = [UIButton new];
    btn1.backgroundColor = [UIColor grayColor];
    [btn1 setTitle:@"按钮1" forState:UIControlStateNormal];
    btn1.frame = CGRectMake(20, 150, 80, 50);
    btn1.tag = 1;
    [btn1 addTarget:self action:@selector(setTitleBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    
    UIButton* btn2 = [UIButton new];
    btn2.backgroundColor = [UIColor grayColor];
    [btn2 setTitle:@"按钮2" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(120, 150, 80, 50);
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(setTitleBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn2];
    
}
- (void)setTitleBtnAction:(id)sender
{
    if([sender isKindOfClass:[UIButton class]]){
        UIButton* btn = sender;
        
        int (^TempBlock)(NSInteger);
        TempBlock = self.getClickInfo;
        
        if (TempBlock) {
            if(TempBlock(btn.tag))
            {
                NSLog(@"设置成功");
            }
        }
    }
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
