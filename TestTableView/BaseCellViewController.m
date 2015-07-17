//
//  BaseCellViewController.m
//  TestTableView
//
//  Created by Lin, Forrest on 7/16/15.
//  Copyright (c) 2015 Lin, Forrest. All rights reserved.
//

#import "BaseCellViewController.h"

@interface BaseCellViewController ()

@end

@implementation BaseCellViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        float headHeight = 80;
        float totalheight = 360;
        self.headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, headHeight)];
        self.headerTitle.backgroundColor = [UIColor whiteColor];
        self.headerTitle.text = @"This is title header";
        [self.view addSubview:self.headerTitle];
        
        self.sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, headHeight, self.view.bounds.size.width, totalheight - headHeight)];
        self.sectionView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:self.sectionView];
        
        
        self.errorView = [[UIView alloc] initWithFrame:CGRectMake(0, headHeight, self.view.bounds.size.width, totalheight - headHeight)];
        self.errorView.backgroundColor = [UIColor redColor];
        [self.view addSubview:self.errorView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapError)];
        tap.numberOfTapsRequired = 1;
        [self.errorView addGestureRecognizer:tap];
        
        self.loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, headHeight, self.view.bounds.size.width, totalheight - headHeight)];
        self.loadingView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:self.loadingView];
        
        
        [self.view bringSubviewToFront:self.loadingView];
        
        NSLog(@"%s",__PRETTY_FUNCTION__);
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(loadError) userInfo:nil repeats:NO];

}

- (void)updateContent:(NSString*)text{
    self.headerTitle.text = text;
}

- (void)loadConent{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [self.view bringSubviewToFront:self.sectionView];
}
- (void)loadError{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [self.view bringSubviewToFront:self.errorView];
}
- (void)loading{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [self.view bringSubviewToFront:self.loadingView];
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(loadConent) userInfo:nil repeats:NO];
}

- (void)tapError{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [self loading];
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
