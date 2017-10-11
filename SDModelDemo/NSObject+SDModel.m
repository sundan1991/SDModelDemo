
//
//  NSObject+SDModel.m
//  SDModelDemo
//
//  Created by suapri on 2017/10/11.
//  Copyright © 2017年 SD. All rights reserved.
//

#import "NSObject+SDModel.h"
#import <objc/runtime.h>

@implementation NSObject (SDModel)

- (instancetype)sd_setModelWithDic:(NSDictionary *)dic {
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self.class, &count);
    NSObject *model = [[self.class alloc] init];
    for (NSUInteger i = 0; i<count; i++) {
        //获取model的成员变量名
        Ivar ivar = ivarList[i];
        const char * name = ivar_getName(ivar);
        NSString *nameStr = [NSString stringWithUTF8String:name];
        //根据model的成员变量名，获取dic对应的value
        NSString *propertyName = nameStr;
        if ([nameStr containsString:@"_"]) {
            NSArray *arr = [nameStr componentsSeparatedByString:@"_"];
            propertyName = arr[1];
        }
        //不想在model里频繁判断，所以写这里了
        //这里需要封装，做成通用
        if ([propertyName isEqualToString:@"ID"]) {
            propertyName = @"id";
        }
        NSString *value = dic[propertyName];
        if ([propertyName isEqualToString:@"id"]) {
            propertyName = @"ID";
        }
        //为model赋值
        if (value.length) {
            [model setValue:value forKey:propertyName];
        }
    }
    return model;
}

@end
