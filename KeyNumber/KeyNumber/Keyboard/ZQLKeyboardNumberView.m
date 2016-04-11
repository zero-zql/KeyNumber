//
//  ZQLKeyboardNumberView.m
//  KeyNumber
//
//  Created by zhuqinlu on 16/4/8.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ZQLKeyboardNumberView.h"
#import "ZQLKeyButton.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

@interface ZQLKeyboardNumberView ()

@property (strong, nonatomic) NSArray *numberKeys;

@property (copy, nonatomic) KeyboardBlock block;

@end

@implementation ZQLKeyboardNumberView
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    int row = 4;
    int column = 3;
    
    CGFloat keyWidth = frame.size.width / column;
    CGFloat keyHeight = frame.size.height / row;
    CGFloat keyX = 0;
    CGFloat keyY = 0;
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < kWMKeyboardNumberKeyCount; i++) {
        ZQLKeyButton *button = [ZQLKeyButton keyButtonWithFrame:CGRectMake(keyX, keyY, keyWidth, keyHeight)];
        [self addSubview:button];
        WS(weakSelf);
        [button setButtonClickBlock:^(WMKeyButtonType buttonType, NSString *text) {
            weakSelf.block(buttonType, text);
        }];
        [array addObject:button];
        if (i == kWMKeyboardNumberDelIndex) {
            button.type = WMKeyButtonTypeDel;
            button.titleLabel.font = [UIFont systemFontOfSize:20];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else if (i == kWMKeyboardNumberDoneIndex) {
            button.type = WMKeyButtonTypeDone;
            button.titleLabel.font = [UIFont systemFontOfSize:20];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        } else {
            button.type = WMKeyButtonTypeOther;
        }
        
        keyX += keyWidth;
        
        if ((i + 1) % column == 0) {
            keyX = 0;
            keyY += keyHeight;
        }
    }
    self.numberKeys = array;
    
    // 水平分隔线
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewW = frame.size.width;
    CGFloat viewH = 0.8;
    for (int i = 0; i < row; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        view.backgroundColor = [UIColor colorWithHexString:@"#dfdfdf"];
        [self addSubview:view];
        
        viewY += keyHeight;
    }
    
    // 垂直分隔线
    viewX = keyWidth;
    viewY = 0;
    viewW = 0.8;
    viewH = frame.size.height;
    for (int i = 0; i < column - 1; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        view.backgroundColor = [UIColor colorWithHexString:@"#dfdfdf"];
        [self addSubview:view];
        
        viewX += keyWidth;
    }
}

- (void)exchangeNumber {
    NSMutableArray *numbers = [NSMutableArray array];
    
    int startNum = 0;
    int length = 10;
    
    for (int i = startNum; i < length; i++) {
        [numbers addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    for (int i = 0; i < self.numberKeys.count; i++) {
        ZQLKeyButton *button = self.numberKeys[i];
        
        if (i == kWMKeyboardNumberDelIndex) {
            [button setTitle:DeleteText forState:UIControlStateNormal];
            continue;
        } else if (i == kWMKeyboardNumberDoneIndex) {
            [button setTitle:DoneText forState:UIControlStateNormal];
            continue;
        }
        
        int index = arc4random() % numbers.count;
        button.titleLabel.font = [UIFont systemFontOfSize:25];
        [button setTitle:numbers[index] forState:UIControlStateNormal];
        
        [numbers removeObjectAtIndex:index];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
