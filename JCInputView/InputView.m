//
//  InputView.m
//  众马付(商户版)
//
//  Created by Aventador on 2017/9/30.
//  Copyright © 2017年 Anonymous. All rights reserved.
//


#import "InputView.h"
#import "UIView+Extend.h"


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


@interface InputView ()

/** 金额*/
@property(nonatomic,copy) NSString *money;


@end

@implementation InputView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UIView *lowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetWidth(self.frame))];
        lowView.backgroundColor = [UIColor orangeColor];
        
        [self addSubview:lowView];
        

       
        CGFloat numBtnW = SCREEN_WIDTH /4;
        CGFloat numBtnH = 362*HEIGHT /4;
        CGFloat numBtnTopY = 0;
        
        
        for (int i = 0; i<15; i++) {
            
             UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i % 4 * numBtnW, numBtnTopY + i / 4 * numBtnH, numBtnW, numBtnH)];
            [btn addTarget:self action:@selector(numBtn:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i;
            btn.backgroundColor = randomColor;
            [lowView addSubview:btn];
            
            [btn setTitle:[NSString stringWithFormat:@"%zi",i+1] forState:UIControlStateNormal];
            
            if (btn.tag == 11) {
                
                btn.hjc_height = 2 * numBtnH;
                
                [btn setTitle:@"确认" forState:UIControlStateNormal];
            }
        
            if (btn.tag == 4 || btn.tag == 5 || btn.tag == 6) {
                
                [btn setTitle:[NSString stringWithFormat:@"%zi", btn.tag ] forState:UIControlStateNormal];
            }
            if (btn.tag == 8 || btn.tag == 9 || btn.tag == 10) {
                
                [btn setTitle:[NSString stringWithFormat:@"%zi", btn.tag -1] forState:UIControlStateNormal];
            }
            
            if (btn.tag ==3 ) {
                
                [btn setTitle:[NSString stringWithFormat:@"删除"] forState:UIControlStateNormal];
                
            }
            if (btn.tag == 7) {
                
                [btn setTitle:[NSString stringWithFormat:@"+"] forState:UIControlStateNormal];
            }
            if (btn.tag == 12) {
                
                [btn setTitle:[NSString stringWithFormat:@"清空"] forState:UIControlStateNormal];
            }
            if (btn.tag == 14) {
                
                [btn setTitle:[NSString stringWithFormat:@"."] forState:UIControlStateNormal];
            }
            
            if (btn.tag == 13) {
                
                [btn setTitle:[NSString stringWithFormat:@"0"] forState:UIControlStateNormal];
            }
            
        }
        
        //横向分割线
        for (int i = 0; i < 4; i++) {
            
            UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, numBtnTopY + numBtnH * i, SCREEN_WIDTH, 1)];
            separator.backgroundColor = [UIColor blackColor];
            [self addSubview:separator];
            
            if (i == 3) {
                separator.hjc_width = SCREEN_WIDTH - numBtnW;
            }
            
        }
        
        //竖直分割线
        for (int i = 0; i < 3; i++) {
            UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(numBtnW * (i + 1), numBtnTopY, 1, numBtnH * 4)];
            separator.backgroundColor = [UIColor blackColor];
            [self addSubview:separator];
            
            if (i ==2) {
                
                separator.hjc_height = numBtnH * 2;
            }
        }
        
    }
    return self;
}

- (void)numBtn:(UIButton *)btn{

    //删除
    if ([btn.titleLabel.text isEqualToString:@"删除"]) {
        
        if (self.money.length > 0) {
            
             self.money = [self.money substringToIndex:self.money.length - 1];
        }
    }else if ([btn.titleLabel.text isEqualToString:@"清空"]) {
        
        self.money = @"";
        
    }else if ([btn.titleLabel.text isEqualToString:@"."]) {
        
        if (self.money.length == 0) {
            
            self.money = @"0.";
        }
        else {
            if (![self.money containsString:@"."]) {
                
                self.money = [self.money stringByAppendingString:@"."];
            }
        }
    }else if ([btn.titleLabel.text isEqualToString:@"确认"]){
    
        NSLog(@"%@",self.money);
        
        /** 这里我项目是跳转页面 各位根据自行需求更换功能*/
        
    }else if ([btn.titleLabel.text isEqualToString:@"0"]){
    
        if (self.money.length ==0) {
            
            self.money = @"0.";
            
        }else if (![self.money containsString:@"0"]){
        
        self.money = [self.money stringByAppendingString:@"0"];
        }
    
    }else{
    
        self.money = [self.money stringByAppendingString:btn.titleLabel.text];
    }
    
    //block
    if (self.inputMoneyBlock) {
        
        self.inputMoneyBlock(self.money);
    }
    

    

}

- (NSString *)money
{
    if (!_money) {
        _money = [[NSString alloc] init];
    }
    return _money;
}

@end
