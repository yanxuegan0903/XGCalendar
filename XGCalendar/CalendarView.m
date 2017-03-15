//
//  CalendarView.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/15.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "CalendarView.h"
#import "Calendar.h"
#import "CalendarCell.h"


#define cellHeight floor(frame.size.width/7.0)


@interface CalendarView ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic,assign)NSInteger firstWeekday;

@property(nonatomic,assign)NSInteger totalDay;


@end




@implementation CalendarView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor purpleColor];
        
        NSLog(@"view frame = %@",NSStringFromCGRect(frame));
        NSLog(@"cellHeight = %f",cellHeight);
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(cellHeight , cellHeight);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, frame.size.width - cellHeight*5, frame.size.width, cellHeight*5) collectionViewLayout:layout];
        [self addSubview:collectionView];
        [collectionView registerClass:[CalendarCell class] forCellWithReuseIdentifier:NSStringFromClass([CalendarCell class])];
        collectionView.backgroundColor = [UIColor greenColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        self.collectionView = collectionView;
        
        
        
        
        
        
        
        
    }
    return self;
}


- (void)setDate:(NSDate *)date{
    _date = date;
    
    self.firstWeekday = [Calendar firstWeekdayInThisMonth:date];
    self.totalDay = [Calendar totaldaysInThisMonth:date];
    
    
    
    
}


#pragma mark - CollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 35;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CalendarCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CalendarCell class]) forIndexPath:indexPath];
    cell.label.text = @"1";
    return cell;
    
}




@end
