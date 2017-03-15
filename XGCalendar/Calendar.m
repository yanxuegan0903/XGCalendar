//
//  Calendar.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/14.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "Calendar.h"

@implementation Calendar

//  这个月有几天
+ (NSInteger)totaldaysInThisMonth:(NSDate *)date{
    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return totaldaysInMonth.length;
}

//  第一天是星期几
+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

//  输入年月日 获取date
+ (NSDate *)dateWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day{
    
    NSDateComponents * comp = [[NSDateComponents alloc] init];
    [comp setDay:day];
    [comp setMonth:month];
    [comp setYear:year];
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    return [calendar dateFromComponents:comp];
}



@end
