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

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createtable];
    }
    return self;
}

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

//  清除全部数据
- (void)clearAll{
    FMManager *dbM = [FMManager shareInsyance];
    
    if ([dbM.db open]) {
        [dbM.db executeUpdate:@"DELETE FROM journal"];
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


- (NSMutableArray *)quaryWith:(NSInteger)date{
    
    FMManager *dbM = [FMManager shareInsyance];
    NSMutableArray * resultArray = [NSMutableArray array];
    
    if ([dbM.db open]) {
        FMResultSet * resultSet = [dbM.db executeQuery:@"select * from Journal where datestamp between ? and ?",@(date),@((date + (24*60*60) - 1))];
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

////  删除一条数据
//- (void)deleteWith:(JournalInfo *)journal{
//    [self open];
//    
//    NSString * sql = [NSString stringWithFormat:@"DELETE FROM Journal WHERE id = %ld",(long)journal.ID];
//    NSLog(@"删除一条数据");
//    if ([self.db executeUpdate:sql withArgumentsInArray:nil]) {
//        NSLog(@"删除一条数据成功");
//    }else{
//        NSLog(@"删除一条数据失败");
//    }
//}


- (void)deleteWith:(JournalInfo*)journal{
    FMManager *dbM = [FMManager shareInsyance];
    if ([dbM.db open]) {
        [dbM.db executeUpdate:@"DELETE FROM Journal WHERE id = ?",@(journal.ID)];
    }
    [dbM.db close];
}

@end
