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
#import "FFScrollLabel.h"

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
    self.title = @"FFKit";
    
    
    
    
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

/**
 * 版本比较
 */
- (void)versionDemo {
    NSString *currentVersion = @"2.5.32";
    NSString *forceVersion = @"2.7.0";
    NSInteger length = (currentVersion.length>forceVersion.length)?currentVersion.length:forceVersion.length;
    if (currentVersion.length < length) {
        while (currentVersion.length < length) {
            currentVersion = [currentVersion stringByAppendingString:@"0"];
        }
    }
    if (forceVersion.length < length) {
        while (forceVersion.length < length) {
            forceVersion = [forceVersion stringByAppendingString:@"0"];
        }
        
    }
    
    NSInteger current = [[currentVersion stringByReplacingOccurrencesOfString:@"." withString:@""] integerValue];
    NSInteger force = [[forceVersion stringByReplacingOccurrencesOfString:@"." withString:@""] integerValue];
    if (current < force) {
        NSLog(@"有新版本更新");
    }else {
        NSLog(@"没有新版本更新");
    }
}


- (void)scrollLabelDemo {
    FFScrollLabel *label = [[FFScrollLabel alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
    label.text = @"撒娇的粉红色敬爱的混分巨兽";
    [self.view addSubview:label];
    [label startScoll];
}


@end
