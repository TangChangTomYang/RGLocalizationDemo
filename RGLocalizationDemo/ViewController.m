//
//  ViewController.m
//  RGLocalizationDemo
//
//  Created by yangrui on 2018/12/28.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 方式1: (未匹配上的本地化语言 有确定性)
    // 在名称为 @"Localization" 的本地化文件中, 去查找 "Cancle" 对应的文字
    // 当在对应文件中没找到 "Cancle" 对应的文字时, 默认值就是 "Cancle"
    // @"按钮的标题" 是对 "Cancle" 对应的文字的描述, 便于翻译人员理解含义,给出正确的翻译
    // 当 tableName 为nil 时, 会自动的去 名为Localization 的本地化文件中查找对应的文字
    NSString *localStr =  NSLocalizedStringFromTable(@"Cancle",@"Localization", @"按钮的标题");
    NSLog(@"localStr : %@",localStr);
    
    
    // 方式2: (强制默认语言,未匹配上的本地化语言 确定性)
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"zh-Hans" ofType:@"lproj"]];
    // 在bundle 中的, 名为@"Localization"的本地化文件, 中去查找@"Cancle1"对应的本地化文字
    NSString *localStr2 = NSLocalizedStringFromTableInBundle(@"Cancle1", @"Localization", bundle, @"按钮的标题2");
    NSLog(@"localStr2 : %@",localStr2);
    
    
    /** 本地化语言的原理说明
     经过测试得出以下结论:
     1. 当app 支持本地化后, app 会去手机的 `语言与地区` 查找当前的首选语言: `简体中文, 英文, 日文...`
     2. 根据查找的首选列表中的语言 匹配app 中的本地化文件, 如果首选语言中第一个就匹配上对应的文件,
     则根据之前的 key 来查找对应的本地化字符串,找到了就用找到的值,找不到就用默认的值(一般就是key值). 如果第一个语言没有匹配上本地化文件就挨着挨着匹配,第二个, 第三个,以此类推的匹配本地文件直到匹配上.
     如果所有的 '首选语言' 都没匹配上就查看 app 中infoplist的 `CFBundleDevelopmentRegion` 对应的值(en / zh-Hans ...) 来匹配本地文件
     */
    
}



@end
