//
//  JournalShowViewController.m
//  XGCalendar
//
//  Created by vsKing on 2017/3/16.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "JournalShowViewController.h"
#import "JournalAddViewController.h"
#import "JournalTableViewCell.h"
#import "FMProduct.h"

@interface JournalShowViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation JournalShowViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self quaryData];
}

- (void)quaryData{
    
    FMProduct * fmp = [[FMProduct alloc] init];
    
    
    self.dataSource = [fmp quaryWith:[self.date timeIntervalSince1970]];
    
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addJournal)];
    self.navigationItem.rightBarButtonItem = myButton;
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:tableView];
    [tableView registerClass:[JournalTableViewCell class] forCellReuseIdentifier:NSStringFromClass([JournalTableViewCell class])];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    self.tableView = tableView;
    
    
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataSource;
}

#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JournalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JournalTableViewCell class]) forIndexPath:indexPath];
    
    cell.journalInfo = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    JournalTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    FMProduct * fmp = [[FMProduct alloc] init];
    [fmp deleteWith:cell.journalInfo];
    [self quaryData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




#pragma mark - 点击添加
- (void)addJournal{
    NSLog(@"点击添加");
    
    JournalAddViewController * vc = [JournalAddViewController new];
    vc.date = self.date;
    [self.navigationController pushViewController:vc animated:YES];
    
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
