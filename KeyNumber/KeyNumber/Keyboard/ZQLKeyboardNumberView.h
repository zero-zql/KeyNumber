//
//  ZQLKeyboardNumberView.h
//  KeyNumber
//
//  Created by zhuqinlu on 16/4/8.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ZQLKeyboardView.h"


static NSInteger const kWMKeyboardNumberKeyCount = 12;
static NSInteger const kWMKeyboardNumberDelIndex = 9;
static NSInteger const kWMKeyboardNumberDoneIndex = 11;

@interface ZQLKeyboardNumberView : ZQLKeyboardView

- (void)exchangeNumber;


@end
