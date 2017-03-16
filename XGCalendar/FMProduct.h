//
//  FMProduct.h
//  XGCalendar
//
//  Created by vsKing on 2017/3/16.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMProduct : NSObject
- (void)createtable;
//- (void)insertIntoTable:(NSInteger)dateStamp title:(NSString *)title content:(NSString *)content;
- (void)insertIntoTable:(NSData *)data;

@end
