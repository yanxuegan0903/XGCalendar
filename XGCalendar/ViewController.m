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

@interface ViewController ()<UICollectionViewDelegate>

@property (nonatomic, strong) CalendarView *calendarView;


@end

@implementation ViewController



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
