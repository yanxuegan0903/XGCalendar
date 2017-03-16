//
//  JournalInfo.h
//  XGCalendar
//
//  Created by vsKing on 2017/3/16.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JournalInfo : NSObject

@property(nonatomic,assign)NSInteger ID;

@property(nonatomic,assign)NSInteger dateStamp;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *content;


@end
