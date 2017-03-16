//
//  FMProduct.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/16.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "FMProduct.h"
#import "FMManager.h"


@implementation FMProduct



//使用数据库时要注意 操作前打开[DBm.db open] 操作结束后一定要关闭[DBm.db close]
//创建表格 表名collect
//- (void)createtable{
//    FMManager *dbM = [FMManager shareInsyance];
//    if ([dbM.db open]) {
//        [dbM.db executeUpdate:@"create table if not exists journal(id integer primary key,datestamp integer ,title text,  content text)"];
//    }
//    [dbM.db close];
//}
//
//
//- (void)insertIntoTable:(NSInteger)dateStamp title:(NSString *)title content:(NSString *)content{
//    FMManager *dbM = [FMManager shareInsyance];
//    if ([dbM.db open]) {
//        [dbM.db executeUpdate:@"insert into journal (datestamp,title,content) values (?,?,?)",dateStamp,title.UTF8String,content.UTF8String];
//    }
//    [dbM.db close];
//}

- (void)createtable{
    FMManager *dbM = [FMManager shareInsyance];
    if ([dbM.db open]) {
        [dbM.db executeUpdate:@"create table if not exists journal(id integer primary key,datestamp blob)"];
    }
    [dbM.db close];
}


- (void)insertIntoTable:(NSData *)data{
    FMManager *dbM = [FMManager shareInsyance];
    if ([dbM.db open]) {
        [dbM.db executeUpdate:@"insert into journal (datestamp) values (?)",data];
    }
    [dbM.db close];
}

@end
