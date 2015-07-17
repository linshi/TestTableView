//
//  ViewController.m
//  TestTableView
//
//  Created by Lin, Forrest on 15/3/5.
//  Copyright (c) 2015年 Lin, Forrest. All rights reserved.
//

#import "ViewController.h"
#import "BaseCellViewController.h"

float kHeight = 360.;

@interface ViewController (){
    NSMutableArray *secControllers;
    int N;
}

@end

@implementation ViewController

- (void)initTableView{
    self.profileTableView = [[UITableView alloc] initWithFrame:[self.view bounds] style:UITableViewStylePlain];
    self.profileTableView.delegate = self;
    self.profileTableView.dataSource = self;
    self.profileTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.profileTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.profileTableView.backgroundColor = [UIColor whiteColor];
    self.profileTableView.autoresizesSubviews = YES;
    [self.view addSubview:self.profileTableView];
    
    UIView * footView = [[ UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    footView.backgroundColor = [UIColor redColor];
    self.profileTableView.tableFooterView = footView;
    
    NSLog(@"load the header ...");
    BaseCellViewController *bvc = [[BaseCellViewController alloc] init];
    bvc.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, kHeight);
    [secControllers addObject:bvc];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(loadOtherSections) userInfo:nil repeats:NO];
}

- (void)loadOtherSections{

    NSLog(@"load the others ....");
    for (int i = 1 ; i < N; i++) {
        BaseCellViewController *bvc = [[BaseCellViewController alloc] init];
        bvc.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, kHeight);
        [secControllers addObject:bvc];
    }
    
    [self.profileTableView reloadData];

}

- (UIColor*)randomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    N = 10;
    secControllers = [NSMutableArray array];
    [self initTableView];
    
    
//    [self.profileTableView reloadData];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"mycell";
    cellId = [NSString stringWithFormat:@"myCell_%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
        BaseCellViewController *bvc = [secControllers objectAtIndex:indexPath.row];
        [bvc updateContent:[NSString stringWithFormat:@"header %d", indexPath.row]];
        [cell addSubview:bvc.view];
    }
    //cell.textLabel.text = [NSString stringWithFormat:@"Item %@",[items objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return secControllers.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kHeight;
}

@end
