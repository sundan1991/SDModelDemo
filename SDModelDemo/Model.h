//
//  Model.h
//  SDModelDemo
//
//  Created by suapri on 2017/10/11.
//  Copyright © 2017年 SD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, copy) NSString  *name;
@property (nonatomic, copy) NSString  *age;
@property (nonatomic, copy) NSString  *sex;
@property (nonatomic, copy) NSString  *address;
@property (nonatomic, copy) NSString  *height;
@property (nonatomic, copy) NSString  *weight;
@property (nonatomic, copy) NSString  *id;//需要优化，兼容大小写不同的对象赋值
@property (nonatomic, copy) NSString  *firstName;
@property (nonatomic, copy) NSString  *secondName;
@property (nonatomic, copy) NSString  *eeName;
@property (nonatomic, copy) NSString  *ddName;

@end
