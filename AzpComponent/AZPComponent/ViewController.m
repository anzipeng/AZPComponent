//
//  ViewController.m
//  AZPComponent
//
//  Created by zipeng an  on 2019/12/11.
//  Copyright © 2019 zipeng an . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * tableDataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    // Do any additional setup after loading the view.
    [self initData];
    [self.view addSubview:self.tableView];
    
}
- (void) initData{
    self.tableDataSource = @[
        @{
            @"title":@"laughImage",
            @"vc":@"laugnImageVc"
        }
    ];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _tableView.delegate = (id)self;
        _tableView.dataSource = (id)self;

    }
    return _tableView;
}
#pragma mark -- tableviewDelegate&&tableViewdataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableDataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"tablecell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tablecell"];
        [cell.textLabel setText:self.tableDataSource[indexPath.row][@"title"]];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * classStr = self.tableDataSource[indexPath.row][@"vc"];
    UIViewController * vc = [NSClassFromString(classStr) new];
    vc.title = self.tableDataSource[indexPath.row][@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
