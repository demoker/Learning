//
//  ViewController.m
//  DKPrepareForWar
//
//  Created by demoker on 2020/3/9.
//  Copyright © 2020 m.demoker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) UITableView *mTableView;

@property (strong, nonatomic) NSMutableArray *dataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"demoker‘s 备战";
    
    self.dataArray = [[NSMutableArray alloc] init];
    NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home" ofType:@"plist"]];
    [self.dataArray addObjectsFromArray:array];
    
    _mTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _mTableView.delegate = self;
    _mTableView.dataSource = self;
    [self.view addSubview:_mTableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * const identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier
                ];
    }
    id value = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [value valueForKey:@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id value = [self.dataArray objectAtIndex:indexPath.row];
    NSString * className = [value valueForKey:@"vcName"];
    UIViewController * vc = (UIViewController *)[[NSClassFromString(className) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
