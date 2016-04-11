//
//  ZQLKeyButton.h
//  KeyNumber
//
//  Created by zhuqinlu on 16/4/8.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQLKeyboardDefine.h"

static CGFloat const WMKeyButtonFont = 15;

typedef void(^buttonClickBlock)(WMKeyButtonType buttonType, NSString *text);

@interface ZQLKeyButton : UIButton

@property (assign, nonatomic) WMKeyButtonType type;

+ (instancetype)keyButtonWithFrame:(CGRect)frame;
- (instancetype)initKeyButtonWithFrame:(CGRect)frame;

- (void)setButtonClickBlock:(buttonClickBlock)block;

@end
