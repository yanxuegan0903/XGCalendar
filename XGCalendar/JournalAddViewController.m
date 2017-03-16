//
//  JournalAddViewController.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/15.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "JournalAddViewController.h"
#import "JournalAddView.h"
#import "FMProduct.h"


@interface JournalAddViewController ()

@property (nonatomic, strong) JournalAddView * addView;

@end

@implementation JournalAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    JournalAddView * addView = [[JournalAddView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [self.view addSubview:addView];
    self.addView = addView;
    
    
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(clickSave)];
    self.navigationItem.rightBarButtonItem = myButton;
    
    if (self.journalInfo) {
        [addView.title setText:self.journalInfo.title];
        [addView.text setText:self.journalInfo.content];
    }
    
    
}


- (void)clickSave{

    
    FMProduct * fmp = [[FMProduct alloc] init];
    
    if (self.journalInfo) {
        self.journalInfo.title = self.addView.title.text;
        self.journalInfo.content = self.addView.text.text;
        [fmp updateWith:self.journalInfo];
    }else{
        
        [fmp insertIntoTableWithDateStamp:[[NSDate date] timeIntervalSince1970] title:self.addView.title.text content:self.addView.text.text];
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


- (void)dealloc{
    NSLog(@"------------>>>>>> dealloc %@",NSStringFromClass([self class]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
