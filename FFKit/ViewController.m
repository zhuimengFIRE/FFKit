//
//  ViewController.m
//  FFKit
//
//  Created by 方超 on 2020/6/16.
//  Copyright © 2020 GTion. All rights reserved.
//

#import "ViewController.h"
#import "FFKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    FFTextField *textField = [[FFTextField alloc] initWithFrame:CGRectMake(100, 200, 100, 45)];
    textField.placeholder = @"123";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholderColor = [UIColor redColor];
    textField.placeholderFont = [UIFont systemFontOfSize:11];
    textField.round = 2;
    [self.view addSubview:textField];
    
}


@end
