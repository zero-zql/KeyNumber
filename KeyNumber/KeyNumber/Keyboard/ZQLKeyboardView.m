//
//  ZQLKeyboardView.m
//  KeyNumber
//
//  Created by zhuqinlu on 16/4/8.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ZQLKeyboardView.h"

@interface ZQLKeyboardView ()

@property (nonatomic ,copy) KeyboardBlock block;

@end

@implementation ZQLKeyboardView

- (instancetype)initKeyboardWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

+ (instancetype)keyboardWithFrame:(CGRect)frame {
    return [[self alloc] initKeyboardWithFrame:frame];
}

- (void)setWMKeyboardBlock:(KeyboardBlock)block {
    self.block = block;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
