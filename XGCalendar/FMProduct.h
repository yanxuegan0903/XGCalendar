//
//  FMProduct.h
//  XGCalendar
//
//  Created by vsKing on 2017/3/16.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMProduct : NSObject



//  插入一条数据
- (void)insertIntoTableWithDateStamp:(NSInteger)dateStamp title:(NSString *)title content:(NSString *)content ;

//  查询所有数据
- (NSMutableArray *)quaryAllData;

//  根据日期查询一条数据
- (NSMutableArray *)quaryWith:(NSInteger)date;

//  清除所有数据
- (void)clearAll;




@end
