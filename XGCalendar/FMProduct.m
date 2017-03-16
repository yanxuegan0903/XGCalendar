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


- (void)createtable{
    FMManager *dbM = [FMManager shareInsyance];
    if ([dbM.db open]) {
        [dbM.db executeUpdate:@"create table if not exists journal(id integer primary key,datestamp integer,title blob,content blob)"];
    }
    [dbM.db close];
}


- (void)insertIntoTableWithDateStamp:(NSInteger)dateStamp title:(NSString *)title content:(NSString *)content {
    FMManager *dbM = [FMManager shareInsyance];
    if ([dbM.db open]) {
        [dbM.db executeUpdate:@"insert into journal (datestamp,title,content) values (?,?,?)",@(dateStamp),[title dataUsingEncoding:NSUTF8StringEncoding],[content dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [dbM.db close];
}

@end
