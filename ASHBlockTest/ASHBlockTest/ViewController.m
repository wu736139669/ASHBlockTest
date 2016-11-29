//
//  ViewController.m
//  ASHBlockTest
//
//  Created by xmfish on 16/11/28.
//  Copyright © 2016年 ash. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()
@property (nonatomic, strong)UILabel* infoLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //第一个int，block的返回值，addBlock block名称，,后面的两个int是传入的参数
    int (^addBlock)(int, int) = ^(int num1, int num2){
        return  num1 + num2;
    };
    
    NSLog(@"相加值是:%d",addBlock(10,20));
    
    //先声明，再实现
    int (^mulBlock)(int, int);
    mulBlock =  ^(int num1, int num2){
        return num1 * num2;
    };
    
    NSLog(@"相乘值是:%d",mulBlock(2,5));
    
    
    UIButton* pushNewBtn = [UIButton new];
    pushNewBtn.backgroundColor = [UIColor grayColor];
    [pushNewBtn setTitle:@"点击" forState:UIControlStateNormal];
    pushNewBtn.frame = CGRectMake(20, 150, 80, 50);
    [pushNewBtn addTarget:self action:@selector(pushNewAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushNewBtn];
    
    self.infoLabel = [UILabel new];
    self.infoLabel.backgroundColor = [UIColor whiteColor];
    self.infoLabel.textColor = [UIColor greenColor];
    self.infoLabel.frame = CGRectMake(120, 150, 180, 50);
    self.infoLabel.text = @"还没有点击";
    
    [self.view addSubview:self.infoLabel];
    
    
    __block int num = 20;
    
    void (^changeNum)(void) = ^(void){
        num = 30;
    };
    NSLog(@"变化之前：%d",num);
    changeNum();
    NSLog(@"变化之后：%d",num);
}

#pragma mark 点击进入下一页
- (void)pushNewAction:(id)sender
{
    ViewController2* nextVC = [ViewController2 new];
    
    __weak ViewController* wself = self;
    
    nextVC.getClickInfo = ^(NSInteger tag){
        
        __strong ViewController* sself = wself;
        
        sself.infoLabel.text = [NSString stringWithFormat:@"点击了第%ld个按钮",tag];
        return 1;
    };
    [self.navigationController pushViewController:nextVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
