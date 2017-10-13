//
//  NSObject+Singleton.m
//  单例和类别的设计
//
//  Created by zx on 2017/10/13.
//  Copyright © 2017年 maple. All rights reserved.
//

#import "NSObject+Singleton.h"

@implementation NSObject (Singleton)

//使用可变字典存储每个类的单一实例，键为类名，值为该类的对象；
//声明为静态变量，可以保存上次的值；
static NSMutableDictionary *instanceDict;
id instance;

+(instancetype)sharedInstance
{
    /*1. synchronized 这个主要是考虑多线程的程序，这个指令可以将{ } 内的代码限制在一个线程执行，如果某个线程没有执行完，其他的线程如果需要执行就得等着。
    Objective-C除了提供异常处理机制外，还提供了线程同步功能。异常处理在前面的“异常处理”章节有介绍。
    @synchronized的作用是创建一个互斥锁，保证此时没有其它线程对self对象进行修改。这个是objective-c的一个锁定令牌，防止self对象在同一时间内被其它线程访问，起到线程的保护作用。 
     ********************* ********************* *********************
     一般在公用变量的时候使用，如单例模式或者操作类的static变量中使用。
     ********************* ********************* *********************/
    @synchronized(self)     //将单例的执行代码限制在一个线程里，防止多个线程访问同一个对象
    {
        //第一次使用，如果没有初始化静态的字典，则初始化字典
        if (instanceDict == nil) {
            instanceDict = [[NSMutableDictionary alloc] init];
        }
        
        //获取类名，如果不存在，返回的是nil
        NSString *className = NSStringFromClass([self class]);
        if (className) {
            //利用NSStringFromClass获取到类的名字，然后通过字典的键来查找包含在字典里面的类是否存在。
            instance = instanceDict[className];
            if(instance == nil){
                //如果没有获取到这个类则代表没有进行实例化并且没有存储进字典
                instance = [[self.class alloc]init];
                [instanceDict setValue:instance forKey:className];
            }else{
                //该类对象已经存储在字典中，直接返回instance即可；
            }
        }else{
            //没有获取类名，所以确保sharedInstance是一个类方法，用类进行调用；
            NSLog(@"未用类方法进行调用，所以NSStringFromClass方法获取不到class的名字");
        }
        
        return instance;
    }
}


@end
