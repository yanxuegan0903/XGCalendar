//
//  JournalAddView.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/15.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "JournalAddView.h"



@implementation JournalAddView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 30, 50, 44)];
        [self addSubview:titleLabel];
        [titleLabel setText:@"标题"];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor colorWithRed:42.0/255 green:63/255.0 blue:81/255.0 alpha:1.0];
        
        UITextField * title = [[UITextField alloc] initWithFrame:CGRectMake(70, 30, frame.size.width - 85, 44)];
        [self addSubview:title];
        title.placeholder = @"标题";
        self.title = title;
        title.backgroundColor = [UIColor colorWithRed:3.0/255 green:63/255.0 blue:81/255.0 alpha:1.0];

        UITextView * text = [[UITextView alloc] initWithFrame:CGRectMake(15, 80, frame.size.width - 15*2, frame.size.height - 80 - 80)];
        [self addSubview:text];
        text.font = [UIFont systemFontOfSize:17];
        self.text = text;
        text.backgroundColor = [UIColor colorWithRed:42.0/255 green:63/255.0 blue:123/255.0 alpha:1.0];

        
        
    }
    return self;
}




@end
