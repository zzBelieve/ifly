//
//  ViewController.m
//  语音识别
//
//  Created by 王夏军 on 16/5/17.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ViewController.h"
#import "ZZiflyTool.h"
@interface ViewController ()
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [[ZZiflyTool shareTool] startRecognizer:^(IFlySpeechError *error, NSString *result) {
        
        
        if (error) {
            
            [self showMes:error.errorDesc];
            
            return;
        }
        
       NSString *str =  result.length ? result:@"没听到你说啥";
        
        [self showMes:str];
        
    }];
  

}

- (void)showMes:(NSString *)message{




    UIAlertController *vc = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        [vc dismissViewControllerAnimated:YES completion:nil];
    }];

    [vc addAction:ac];

    [self presentViewController:vc animated:YES completion:nil];

}
@end
