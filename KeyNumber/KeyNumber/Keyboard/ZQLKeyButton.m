//
//  ZQLKeyButton.m
//  KeyNumber
//
//  Created by zhuqinlu on 16/4/8.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ZQLKeyButton.h"

@interface ZQLKeyButton ()

@property (copy, nonatomic) buttonClickBlock block;


@end

@implementation ZQLKeyButton
+ (instancetype)keyButtonWithFrame:(CGRect)frame {
    return [[self alloc] initKeyButtonWithFrame:frame];
}

- (instancetype)initKeyButtonWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:WMKeyButtonFont];
        [self setTitleColor:UIColorHex(0x333333) forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"#dfdfdf"]] forState:UIControlStateHighlighted];
        [self addTarget:self action:@selector(keyClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setButtonClickBlock:(buttonClickBlock)block {
    self.block = block;
}

- (void)keyClicked:(ZQLKeyButton *)button {
    NSString *text = @"";
    if (self.type == WMKeyButtonTypeOther) {
        text = button.titleLabel.text;
    }
    self.block(self.type, text);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
