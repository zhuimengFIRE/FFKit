//
//  ViewController.m
//  FFKit
//
//  Created by 方超 on 2020/6/16.
//  Copyright © 2020 GTion. All rights reserved.
//

#import "ViewController.h"
#import "FFKit.h"
#import "FFTableViewReloadTestController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configer];
}

- (void)configer {
    [self configerView];
    [self configerData];
}
- (void)configerView {
    self.view.backgroundColor = [UIColor whiteColor];
    [self tableViewReloadDemo];
}
- (void)configerData {
    
}






#pragma mark - 示例

/**
 * UITableViewReload示例
 */
- (void)tableViewReloadDemo {
    FFButton *button = [FFButton buttonWithFrame:CGRectMake(100, 200, 200, 45) title:@"UITableViewReloadTest" font:nil titleColor:nil backgroundColor:[UIColor redColor] block:^(UIButton * _Nonnull button) {
        FFTableViewReloadTestController *vc = [[FFTableViewReloadTestController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    [self.view addSubview:button];
}

/**
 * 输入框示例
 */
- (void)textFieldDemo {
    FFTextField *textField = [[FFTextField alloc] initWithFrame:CGRectMake(100, 200, 100, 45)];
    textField.placeholder = @"123";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholderColor = [UIColor redColor];
    textField.placeholderFont = [UIFont systemFontOfSize:11];
    textField.round = 2;
    [self.view addSubview:textField];
    
}


@end
