//
//  ViewController.m
//  TestTableView
//
//  Created by Lin, Forrest on 15/3/5.
//  Copyright (c) 2015年 Lin, Forrest. All rights reserved.
//

#import "ViewController.h"
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

@end
