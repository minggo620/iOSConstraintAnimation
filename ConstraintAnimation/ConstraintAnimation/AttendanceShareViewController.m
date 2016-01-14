//
//  AttendanceShareViewController.m
//  Demo
//
//  Created by minggo on 16/1/8.
//  Copyright © 2016年 mengmengda. All rights reserved.
//

#import "AttendanceShareViewController.h"

static NSString *statName = @"attendanceSharePage";
@interface AttendanceShareViewController ()
- (IBAction)dimiss:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *prograss1Iv;
@property (weak, nonatomic) IBOutlet UIImageView *prograss2Iv;
@property (weak, nonatomic) IBOutlet UIImageView *prograss3Iv;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *prograss1MarginRight;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *prograss2MarginRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *prograss3MarginRight;
@property (weak, nonatomic) IBOutlet UILabel *userName1Lb;
@property (weak, nonatomic) IBOutlet UILabel *userName2Lb;
@property (weak, nonatomic) IBOutlet UILabel *userName3Lb;
@property (weak, nonatomic) IBOutlet UILabel *dayTextLb;
@property (weak, nonatomic) IBOutlet UILabel *wordTextLb;
@property (weak, nonatomic) IBOutlet UIView *mainView;
- (IBAction)share:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *levelLb;
@property (weak, nonatomic) IBOutlet UILabel *percentLb;
@property (weak, nonatomic) IBOutlet UILabel *beyondPercentLb;
@property (weak, nonatomic) IBOutlet UILabel *dayCountLb;
@property (weak, nonatomic) IBOutlet UILabel *wordCountLb;
@property (weak, nonatomic) IBOutlet UIImageView *user1Iv;
@property (weak, nonatomic) IBOutlet UIImageView *user2Iv;
@property (weak, nonatomic) IBOutlet UIImageView *user3Iv;


@end

@implementation AttendanceShareViewController{
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
   
}

-(void)initUI{
    self.view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.8];
    
    self.prograss1MarginRight.constant = self.prograss1Iv.frame.size.width*2-10;
    self.prograss2MarginRight.constant = self.prograss2Iv.frame.size.width*2-10;
    self.prograss3MarginRight.constant = self.prograss3Iv.frame.size.width*2-10;
    
    self.userName1Lb.alpha = 0;
    self.userName2Lb.alpha = 0;
    self.userName3Lb.alpha = 0;
    self.dayTextLb.layer.cornerRadius = 7;
    self.dayTextLb.layer.masksToBounds = YES;
    self.wordTextLb.layer.cornerRadius = 7;
    self.wordTextLb.layer.masksToBounds = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self startAnimation];//放在viewDidAppear才会有动画效果
}
-(void)startAnimation{
    
    self.prograss1MarginRight.constant = 20;
    self.prograss2MarginRight.constant = 60;
    self.prograss3MarginRight.constant = 100;
    
    [UIView animateWithDuration:1 animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        //动画完成之后将昵称渐变出现
        [UIView animateWithDuration:0.3  animations:^{
            self.userName1Lb.alpha = 1;
            self.userName2Lb.alpha = 1;
            self.userName3Lb.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }];
}



- (IBAction)dimiss:(id)sender {
    
}
- (IBAction)share:(id)sender {
    
}

@end
