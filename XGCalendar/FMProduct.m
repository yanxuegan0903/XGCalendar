//
//  FMProduct.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/16.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "FMProduct.h"
#import "FMManager.h"
#import "JournalInfo.h"

@implementation FMProduct


- (void)createtable{
    FMManager *dbM = [FMManager shareInsyance];
    if ([dbM.db open]) {
        [dbM.db executeUpdate:@"create table if not exists journal(id integer primary key,datestamp integer,title blob,content blob)"];
    }
    [dbM.db close];
}

//  删除表
- (void)dropTable{
    FMManager *dbM = [FMManager shareInsyance];
    
    if ([dbM.db open]) {
        [dbM.db executeUpdate:@"drop table if exists journal"];
    }
    [dbM.db close];
    
}

//  插入
- (void)insertIntoTableWithDateStamp:(NSInteger)dateStamp title:(NSString *)title content:(NSString *)content {
    FMManager *dbM = [FMManager shareInsyance];
    if ([dbM.db open]) {
        [dbM.db executeUpdate:@"insert into journal (datestamp,title,content) values (?,?,?)",@(dateStamp),[title dataUsingEncoding:NSUTF8StringEncoding],[content dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [dbM.db close];
}
//  搜索全部
//- (NSMutableArray *)quaryAllData{
//    [self open];
//    
//    NSString * sql = @"select * from Journal";
//    FMResultSet * resultSet = [self.db executeQuery:sql withArgumentsInArray:nil];
//    
//    NSMutableArray * resultArray = [NSMutableArray arrayWithCapacity:1];
//    
//    while ([resultSet next]) {
//        
//        JournalInfo * journal = [[JournalInfo alloc] init];
//        journal.dateStamp = [resultSet longForColumn:@"datestamp"];
//        journal.title = [NSKeyedUnarchiver unarchiveObjectWithData:[resultSet dataForColumn:@"title"]];
//        journal.text = [NSKeyedUnarchiver unarchiveObjectWithData:[resultSet dataForColumn:@"text"]];
//        journal.ID = [resultSet intForColumn:@"id"];
//        [resultArray addObject:journal];
//        
//    }
//    
//    
//    return resultArray;
//}
- (NSMutableArray *)quaryAllData{
    
    FMManager *dbM = [FMManager shareInsyance];
    NSMutableArray * resultArray = [NSMutableArray array];
    
    if ([dbM.db open]) {
        FMResultSet * resultSet = [dbM.db executeQuery:@"select * from Journal"];

        while ([resultSet next]) {
            
            JournalInfo * journal = [[JournalInfo alloc] init];
            journal.ID = [resultSet intForColumn:@"id"];
            journal.dateStamp = [resultSet intForColumn:@"datestamp"];
            journal.title = [[NSString alloc] initWithData:[resultSet dataForColumn:@"title"] encoding:NSUTF8StringEncoding];
            journal.content = [[NSString alloc] initWithData:[resultSet dataForColumn:@"content"] encoding:NSUTF8StringEncoding];
            
            [resultArray addObject:journal];
            
            
        }
    }
    [dbM.db close];
    
    return resultArray;
}

@end
