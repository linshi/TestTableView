//
//  ViewController.m
//  TestTableView
//
//  Created by Lin, Forrest on 15/3/5.
//  Copyright (c) 2015年 Lin, Forrest. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "CellView.h"

@interface ViewController (){
    NSMutableArray *items;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    items = @[@1,@7];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"UPDATE" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {

        [self.tableView reloadData];
        
//        NSIndexPath *cellIndexPath =  [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.tableView beginUpdates];
//        [self.tableView reloadRowsAtIndexPaths: [NSArray arrayWithObjects: cellIndexPath , nil] withRowAnimation: UITableViewRowAnimationNone];
//        [self.tableView endUpdates];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;//[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
        CellView *v = [[CellView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        [cell addSubview:v];
        
        cell.backgroundColor = [UIColor greenColor];
    }
    //cell.textLabel.text = [NSString stringWithFormat:@"Item %@",[items objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderView *headerView = [[HeaderView alloc] initWithFrame:CGRectZero];
    headerView.backgroundColor = [UIColor redColor];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

@end
