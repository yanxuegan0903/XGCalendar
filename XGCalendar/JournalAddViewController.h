//
//  JournalAddViewController.h
//  XGCalendar
//
//  Created by vsKing on 2017/3/15.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JournalInfo.h"

@interface JournalAddViewController : UIViewController

@property (nonatomic, strong) JournalInfo *journalInfo;

@property (nonatomic, strong) NSDate *date;

@end
