//
//  NSObject+Singleton.h
//  单例和类别的设计
//
//  Created by zx on 2017/10/13.
//  Copyright © 2017年 maple. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  使用Category类别增加NSObject中的方法；
 *  NSObject中就包含了sharedInstance单例，
 *  而所有的对象都继承与NSObject，
 *  所以所有对象都可以调用到sharedInstance的类方法
 */

@interface NSObject (Singleton)

+(instancetype)sharedInstance;


@end
