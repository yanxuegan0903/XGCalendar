//
//  ViewController.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/14.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "ViewController.h"
#import "Calendar.h"
#import "CalendarView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
//    NSLog(@"这个月第一天是星期几 %ld", (long)[Calendar firstWeekdayInThisMonth:[Calendar dateWithYear:2017 month:1 day:1]]);
//
//    NSLog(@"这个月有几天  %ld",(long)[Calendar totaldaysInThisMonth:[Calendar dateWithYear:2017 month:1 day:1]]);
//
//    NSLog(@"获取的日期 %@",[Calendar dateWithYear:2017 month:1 day:1]);
//    
//    NSLog(@"date = %@",[NSDate date]);
//    
    
    NSLog(@"self.view.frame.size.width = %f",self.view.frame.size.width);
    
    CalendarView * calendarView = [[CalendarView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width)];
    [self.view addSubview:calendarView];
    
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
