
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
        [self sd_recursionSetValueWithDic:dic propertyName:propertyName model:model];
        //判断字典里有没有这个key
        if ([dic.allKeys containsObject:[propertyName lowercaseString]]) {
            [self sd_detailSetValueWithDic:dic propertyName:propertyName model:model];
        }
    }
    return model;
}

//递归为subdic赋值
- (void)sd_recursionSetValueWithDic:(NSDictionary *)dic propertyName:(NSString *)propertyName model:(NSObject *)model{
    int i = 0;
    for (id newValue in dic.allValues) {
        i++;
        if ([newValue isKindOfClass:[NSDictionary class]]) {
            NSDictionary *subDic = (NSDictionary *)newValue;
            //dic里包含数组
            //判断字典里有没有这个key
            if ([subDic.allKeys containsObject:propertyName]) {
                [self sd_detailSetValueWithDic:subDic propertyName:propertyName model:model];
            }
            else {
                //go on
                [self sd_recursionSetValueWithDic:subDic propertyName:propertyName model:model];
                break;
            }
        }
        else{
            if (dic.allKeys.count == i) {
                break;
            }
        }
    }
}

- (void)sd_detailSetValueWithDic:(NSDictionary *)dic propertyName:(NSString *)propertyName model:(NSObject *)model {
    NSString *value = dic[propertyName];
    //为model赋值
    if (value.length) {
        [model setValue:value forKey:propertyName];
    }
    else{
        //没有拿到value
        NSLog(@"%@",propertyName);
    }
}

@end
