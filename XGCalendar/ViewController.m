//
//  ViewController.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/14.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "ViewController.h"
#import "CalendarView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    CalendarView * calendarView = [[CalendarView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width+(self.view.frame.size.width/7.0))];
    [self.view addSubview:calendarView];
    
    calendarView.date = [NSDate date];
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
