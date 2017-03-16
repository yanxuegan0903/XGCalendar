//
//  FMManager.h
//  XGCalendar
//
//  Created by vsKing on 2017/3/16.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"


@interface FMManager : NSObject

@property (nonatomic, strong) FMDatabase *db;

//类方法使用即调用
+ (FMManager *)shareInsyance;


@end
