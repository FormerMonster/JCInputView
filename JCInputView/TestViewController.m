//
//  TestViewController.m
//  JCInputView
//
//  Created by Aventador on 2017/9/30.
//  Copyright © 2017年 Anonymous. All rights reserved.
//

#import "TestViewController.h"
#import "InputView.h"

/** 屏幕宽 */
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
/** 屏幕高 */
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/** 比例*/
#define HEIGHT       [[UIScreen mainScreen] bounds].size.height/667
#define WIDTH       [[UIScreen mainScreen] bounds].size.width/375

//随机色
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80,SCREEN_WIDTH , 50)];
    moneyLabel.backgroundColor = randomColor;
    
    [self.view addSubview:moneyLabel];
    
    UILabel *totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(moneyLabel.frame)+20,SCREEN_WIDTH , 50)];
    totalLabel.backgroundColor = randomColor;
    [self.view addSubview:totalLabel];
    
    
    InputView *moneyInput = [[InputView alloc] initWithFrame:CGRectMake(0,SCREEN_HEIGHT -362*HEIGHT, SCREEN_WIDTH, 362*HEIGHT)];
    
    moneyInput.inputMoneyBlock = ^(NSString *money) {
        moneyLabel.text = money;
        
        
        NSArray *moneyAry = [money componentsSeparatedByString:@"+"];
        
        CGFloat sum = [[moneyAry valueForKeyPath:@"@sum.floatValue"] floatValue];
        
        NSString *sumStr = [NSString stringWithFormat:@"%.2f",sum];
        
        totalLabel.text = sumStr;
        
    };
 
    [self.view addSubview:moneyInput];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
