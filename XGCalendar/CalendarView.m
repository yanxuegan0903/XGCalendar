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


#define cellHeight frame.size.width/7.0


typedef enum : NSUInteger {
    ArrowTagLeft = 0,
    ArrowTagRight,
} ArrowTag;



@interface CalendarView ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic,assign)NSInteger firstWeekday;

@property(nonatomic,assign)NSInteger totalDay;

@property (nonatomic, strong) NSArray *weekArray;

@property (nonatomic, strong) UIButton *yearButton;

@property (nonatomic, strong) UIButton *monthButton;

@property (nonatomic, strong) NSDate *dayFirstDate;     //  一天最开始的时间戳

@end




@implementation CalendarView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor purpleColor];
        
        
        //  左边箭头
        UIButton * leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, cellHeight, cellHeight)];
        [self addSubview:leftButton];
        [leftButton setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        leftButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
        leftButton.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
        leftButton.tag = ArrowTagLeft;
        [leftButton addTarget:self action:@selector(clickArrow:) forControlEvents:UIControlEventTouchUpInside];

        
        //  右边箭头
        UIButton * rightButton = [[UIButton alloc] initWithFrame:CGRectMake(cellHeight*6, 0, cellHeight, cellHeight)];
        [self addSubview:rightButton];
        [rightButton setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        rightButton.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        rightButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
        rightButton.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
        rightButton.tag = ArrowTagRight;
        [rightButton addTarget:self action:@selector(clickArrow:) forControlEvents:UIControlEventTouchUpInside];

        
        //  年的按钮
        UIButton * yearButton = [[UIButton alloc] initWithFrame:CGRectMake(cellHeight* 1.5, 0, cellHeight*2.0, cellHeight)];
        [self addSubview:yearButton];
        [yearButton setBackgroundColor:[UIColor clearColor]];
        yearButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.yearButton = yearButton;
        
        
        //  月的按钮
        UIButton * monthButton = [[UIButton alloc] initWithFrame:CGRectMake(cellHeight* 3.5, 0, cellHeight*2.0, cellHeight)];
        [self addSubview:monthButton];
        [monthButton setBackgroundColor:[UIColor clearColor]];
        monthButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.monthButton = monthButton;
        
        
        //  用来显示星期几的label
        for (int i = 0; i<7; i++) {
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(cellHeight * i, cellHeight, cellHeight, cellHeight)];
            [self addSubview:label];
            label.text = [self.weekArray objectAtIndex:i];
            label.textAlignment = NSTextAlignmentCenter;
            
        }
        
        
        //  用来显示日期的 collectionView
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(cellHeight , cellHeight);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, frame.size.height - cellHeight*6, frame.size.width, cellHeight*6) collectionViewLayout:layout];
        [self addSubview:collectionView];
        [collectionView registerClass:[CalendarCell class] forCellWithReuseIdentifier:NSStringFromClass([CalendarCell class])];
        collectionView.backgroundColor = [UIColor greenColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        self.collectionView = collectionView;
        
        
    }
    return self;
}

- (NSArray *)weekArray{
    if (!_weekArray) {
        _weekArray = [NSArray arrayWithObjects:@"日",@"一",@"二",@"三",@"四",@"五",@"六", nil];
    }
    return _weekArray;
}


#pragma mark - 设置时间戳  获取并展示时间信息

- (void)setDate:(NSDate *)date{
    _date = date;
    
    self.firstWeekday = [Calendar firstWeekdayInThisMonth:date];
    self.totalDay = [Calendar totaldaysInThisMonth:date];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    [self.yearButton setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
    [formatter setDateFormat:@"MM"];
    [self.monthButton setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
    
    [formatter setDateFormat:@"yyyyMMdd"];
    self.dayFirstDate = [formatter dateFromString:[formatter stringFromDate:date]];
    
    [self.collectionView reloadData];
    
}


#pragma mark - CollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 42;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CalendarCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CalendarCell class]) forIndexPath:indexPath];
    
    if (self.totalDay > 0) {
        
        if (indexPath.row >= self.firstWeekday && indexPath.row <(self.totalDay + self.firstWeekday)) {
            cell.label.text = [NSString stringWithFormat:@"%d",indexPath.row-self.firstWeekday+1];
            cell.date = [Calendar dateWithYear:self.yearButton.titleLabel.text.integerValue month:self.monthButton.titleLabel.text.integerValue day:cell.label.text.integerValue];
            
            
            if ([cell.date timeIntervalSince1970] == [self.dayFirstDate timeIntervalSince1970]) {
                NSLog(@"self.dayFirstDate = %@ cell.date = %@",self.dayFirstDate,cell.date);

                cell.label.backgroundColor = [UIColor grayColor];
            }else{
                cell.label.backgroundColor = [UIColor redColor];
            }
        }else{
            cell.label.text = @"";
            cell.date = nil;
            cell.label.backgroundColor = [UIColor redColor];
        }
    }else{
        cell.label.text = @"";
        cell.date = nil;
        cell.label.backgroundColor = [UIColor redColor];
    }
    
    return cell;
    
}


#pragma mark - CollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CalendarCell * cell = (CalendarCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.date = cell.date;
}


#pragma mark - 左右箭头点击时间

- (void)clickArrow:(UIButton *)sender{
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents * comp = [[NSDateComponents alloc] init];
    [comp setMonth:sender.tag == ArrowTagRight ? 1 : -1 ];
    self.date = [calendar dateByAddingComponents:comp toDate:self.date options:0];
    
}


@end
