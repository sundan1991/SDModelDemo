//
//  ViewController.m
//  SDModelDemo
//
//  Created by suapri on 2017/10/11.
//  Copyright © 2017年 SD. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+SDModel.h"
#import "Model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{
                          @"id":@"0",
                          @"name":@"suapri",
                          @"age":@"18",
                          @"sex":@"female",
                          @"address":@"BeiJing",
                          @"height":@"160cm",
                          @"weight":@"90"
                          };
    __unused Model *model = [Model sd_setModelWithDic:dic];
    
}

@end
