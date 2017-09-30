//
//  InputView.h
//  众马付(商户版)
//
//  Created by Aventador on 2017/9/30.
//  Copyright © 2017年 Anonymous. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^InputMoneyBlock)(NSString *money);


@interface InputView : UIView
/** 控制器 */
@property(nonatomic, strong) UIViewController *myViewController;


/** block */
@property (nonatomic, copy) InputMoneyBlock inputMoneyBlock;


@end
