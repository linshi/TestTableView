//
//  HeaderView.m
//  TestTableView
//
//  Created by Lin, Forrest on 15/3/5.
//  Copyright (c) 2015年 Lin, Forrest. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    whiteView = [UIView new];
    whiteView.backgroundColor = [UIColor blueColor];
    [self addSubview:whiteView];
    
    
    lineView = [UIView new];
    lineView.backgroundColor = [UIColor blackColor];
    [self addSubview:lineView];
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    whiteView.frame = CGRectMake(0, 0, 320, 10);
    
    lineView.frame = CGRectMake(20, 0, self.frame.size.width -40, 2);
    lineView.center = self.center;
    
}

@end
