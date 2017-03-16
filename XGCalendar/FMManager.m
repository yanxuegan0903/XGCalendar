//
//  FMManager.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/16.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "FMManager.h"

@implementation FMManager

+ (FMManager *)shareInsyance{
    static FMManager *fm;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fm = [[FMManager alloc] init];
    });
    return fm;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //数据库路径
        NSString *s = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        //第一次调用则在此路径下创建program.sql文件 如果已存在直接使用
        NSString *path = [s stringByAppendingString:@"/journal.sqlite"];
        self.db = [FMDatabase databaseWithPath:path];
    }
    return self;
}


@end
