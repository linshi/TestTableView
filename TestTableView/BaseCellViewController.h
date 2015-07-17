//
//  BaseCellViewController.h
//  TestTableView
//
//  Created by Lin, Forrest on 7/16/15.
//  Copyright (c) 2015 Lin, Forrest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCellViewController : UIViewController

- (instancetype)init;

@property (strong)  UILabel *headerTitle;
@property (strong)  UIView *sectionView;
@property (strong)  UIView *loadingView;
@property (strong)  UIView *errorView;

- (void)updateContent:(NSString*)text;
@end
