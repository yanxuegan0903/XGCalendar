//
//  JournalInfo.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/16.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "JournalInfo.h"

@implementation JournalInfo

- (NSString *)description
{
    return [NSString stringWithFormat:@"ID = %ld,dateStamp = %ld,title = %@,content = %@", (long)self.ID,(long)self.dateStamp,self.title,self.content];
}


@end
