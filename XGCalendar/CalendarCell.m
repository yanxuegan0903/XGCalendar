//
//  CalendarCell.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/15.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "CalendarCell.h"

@implementation CalendarCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.backgroundColor = [UIColor colorWithRed:(arc4random() % 255) green:(arc4random() % 255) blue:(arc4random() % 255) alpha:1.0];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width*0.2/2.0, frame.size.width*0.2/2.0, frame.size.width*0.8, frame.size.height*0.8)];
        [self addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor redColor];
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = label.frame.size.height/2;
        self.label = label;
        
        
        
        
    }
    return self;
}




@end
