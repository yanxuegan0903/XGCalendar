//
//  Calendar.h
//  XGCalendar
//
//  Created by vsKing on 2017/3/14.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calendar : NSObject


//  第一天是星期几
+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;

//  这个月有几天
+ (NSInteger)totaldaysInThisMonth:(NSDate *)date;

//  输入年月日 获取date
+ (NSDate *)dateWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;

@end
