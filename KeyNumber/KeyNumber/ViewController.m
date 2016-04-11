//
//  ViewController.m
//  KeyNumber
//
//  Created by zhuqinlu on 16/4/8.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ViewController.h"

#import "ZQLKeyboardNumberView.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic ,strong) ZQLKeyboardNumberView
*keyboardNumberView;
@property (nonatomic ,strong) UITextField *tf;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditChanged:) name:UITextViewTextDidChangeNotification object:nil];
    
    
    self.keyboardNumberView =[ZQLKeyboardNumberView keyboardWithFrame:CGRectMake(0, 0, self.view.frame.size.width, WMKeyboardViewHeight)];
    
    self.tf = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 200, 40)];
    self.tf.secureTextEntry = YES;
    self.tf.delegate = self;
    [self.view addSubview:self.tf];
    

    self.tf.inputView = self.keyboardNumberView;
    
    WS(weakSelf);
    [self.keyboardNumberView setWMKeyboardBlock:^(WMKeyButtonType type, NSString *text) {
        
        [weakSelf changeTextField:type Text:text];
    }];
}

#pragma mark - UITextFieldDelegate

- (void)textFiledEditChanged:(NSNotification *)obj
{
    if ([self.tf isFirstResponder]) {
        
        
        if (self.tf.text.length > 10) {
        
            return;
        }
    }
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.keyboardNumberView exchangeNumber];
    return
    YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([self.tf isFirstResponder]) {

        
        if (self.tf.text.length > 10) {
            
            return  NO;
        }
    }
   return YES;
}

- (void)changeTextField:(WMKeyButtonType)type Text:(NSString *)text {
    switch (type) {
        case WMKeyButtonTypeDel: {
            [self.tf changetext:text];
        }
            break;
            
        case WMKeyButtonTypeDone: {
            
            if (self.tf.text.length > 6) {
                
                NSLog(@"bunenddddd");
            }
            
            [self backgroundTapped];
        }
            break;
            
        case WMKeyButtonTypeOther: {
            [self.tf changetext:text];
        }
            break;
    }
}

- (void)backgroundTapped {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
