//
//  CellView.m
//  TestTableView
//
//  Created by Lin, Forrest on 5/25/15.
//  Copyright (c) 2015 Lin, Forrest. All rights reserved.
//

#import "CellView.h"

@implementation CellView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        label.text = @"DEMO";
        
        self.backgroundColor = [UIColor redColor];
        [self addSubview:label];
        
        //[NSTimer timerWithTimeInterval:2 target:self selector:@selector(updateLabel) userInfo:nil repeats:NO];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self updateLabel];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"UPDATE" object:nil];
        });

    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    [super drawRect:rect];
//    
//    NSLog(@"%s",__PRETTY_FUNCTION__);
//    label.frame = CGRectMake(0, 0, 200, 100);
//    label.text = @"draw";
//    label.backgroundColor = [UIColor yellowColor];
//    
//}

- (void)layoutSubviews{
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    label.frame = CGRectMake(0, 0, 200, 200);
    //label.text = @"layout";
    label.backgroundColor = [UIColor grayColor];
    
}


- (void)updateLabel{
    
        NSLog(@"%s",__PRETTY_FUNCTION__);
    
    label.text = @"Update";
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}


@end
