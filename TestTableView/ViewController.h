//
//  ViewController.h
//  TestTableView
//
//  Created by Lin, Forrest on 15/3/5.
//  Copyright (c) 2015年 Lin, Forrest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

}

@property (nonatomic,strong) UITableView *profileTableView;


@end

