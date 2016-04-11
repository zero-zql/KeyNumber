//
//  ZQLKeyboardView.h
//  KeyNumber
//
//  Created by zhuqinlu on 16/4/8.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQLKeyboardDefine.h"


/// 键盘的高度
static CGFloat WMKeyboardViewHeight = 250;

typedef void(^KeyboardBlock)(WMKeyButtonType type,NSString *text);

@interface ZQLKeyboardView : UIView

- (instancetype)initKeyboardWithFrame:(CGRect)frame;
+ (instancetype)keyboardWithFrame:(CGRect)frame;

- (void)setWMKeyboardBlock:(KeyboardBlock)block;


@end
