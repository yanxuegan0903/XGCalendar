//
//  JournalTableViewCell.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/15.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "JournalTableViewCell.h"

@interface JournalTableViewCell ()

@property (nonatomic, strong) UILabel *timeStampLabel;

@property (nonatomic, strong) UILabel *titleLabel;


@end


@implementation JournalTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        UILabel *timeStampLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, self.frame.size.height)];
        [self addSubview:timeStampLabel];
        timeStampLabel.text = @"timeStampLabhel";
        timeStampLabel.font = [UIFont systemFontOfSize:14];
        self.timeStampLabel = timeStampLabel;
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 0, self.frame.size.width - 165, self.frame.size.height)];
        [self addSubview:titleLabel];
        titleLabel.text = @"timeStampLabhel";
        titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel = titleLabel;
        
        
        
        
    }
    return self;
}



//
//- (void)setJournalInfo:(JournalInfo *)journalInfo{
//    _journalInfo = journalInfo;
//    
//    [self.timeStampLabel setText:[NSString stringWithFormat:@"%ld",(long)journalInfo.dateStamp]];
//    [self.titleLabel setText:journalInfo.title];
//    
//    
//}







- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
