//
//  Persion.m
//  单例和类别的设计
//
//  Created by zx on 2017/10/13.
//  Copyright © 2017年 maple. All rights reserved.
//

#import "Persion.h"

@implementation Persion
{
    NSInteger count;
}

//自定义初始化
-(instancetype)init{
    if (self = [super init]) {
        count = 0;
    }
    return self;
}

//用来验证是否访问的是同一个单例
- (void)changeNum
{
    count++;
    NSLog(@"%ld",(long)count);
}

@end
