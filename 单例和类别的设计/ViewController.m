//
//  ViewController.m
//  单例和类别的设计
//
//  Created by zx on 2017/10/13.
//  Copyright © 2017年 maple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger count;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    count = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"%@",className);
    
    //使用单例创建类对象
    ViewController *vc1 = [ViewController sharedInstance];
    [vc1 changeNum];
    ViewController *vc2 = [ViewController sharedInstance];
    [vc2 changeNum];
    
    NSLog(@"ViewController--->vc1地址:%@",vc1);
    NSLog(@"ViewController--->vc2地址:%@",vc2);
    if (vc1 == vc2) {
        NSLog(@"ViewController---vc1 == vc2");
    }
    
    //循环创建5个Person对象，5个对象都相同；
    for (int i = 0; i < 5; i++) {
        Persion *per1 = [Persion sharedInstance];
        
        NSLog(@"ViewController--->per1地址：%@",per1);
        NSLog(@"Persion--->per1 count：");
        [per1 changeNum];
    }
    
    //使用alloc创建对象，每个对象都是不同的；
    for (int i = 0; i < 5; i++) {
        Person2 *stud = [[Person2 alloc] init];
        [stud changeNum];
        NSLog(@"ViewController---stud地址：%@",stud);
        NSLog(@"stud--->stud count：");
        [stud changeNum];
    }
}
//用来验证是否访问的是同一个单例
- (void)changeNum
{
    count++;
    NSLog(@"%ld",(long)count);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
