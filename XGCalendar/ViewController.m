//
//  ViewController.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/14.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "ViewController.h"
#import "CalendarView.h"
#import "CalendarCell.h"
#import "JournalShowViewController.h"
#import "FMProduct.h"

@interface ViewController ()<UICollectionViewDelegate>

@property (nonatomic, strong) CalendarView *calendarView;


@end

@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    FMProduct * fmP = [[FMProduct alloc] init];
    [fmP createtable];
//    [fmP insertIntoTable:123456 title:@"wo3" content:@"sfsdf"];
    NSString * str = @"woshishui我是谁123";
    [fmP insertIntoTableWithDateStamp:[[NSDate date] timeIntervalSince1970] title:str content:str];

    NSLog(@"123");
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    CalendarView * calendarView = [[CalendarView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width+(self.view.frame.size.width/7.0))];
    [self.view addSubview:calendarView];
    calendarView.collectionView.delegate = self;
    calendarView.date = [NSDate date];
    self.calendarView = calendarView;
    
    
    
    
    
}

#pragma mark - CollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CalendarCell * cell = (CalendarCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (cell.date) {
        self.calendarView.date = cell.date;
        JournalShowViewController * vc = [JournalShowViewController new];
        vc.date = cell.date;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
