//
//  ViewController.m
//  Shake
//
//  Created by Apple on 2016/12/23.
//  Copyright © 2016年 White-Young. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface ViewController (){
    NSTimer *_time;
}
@property (weak, nonatomic) IBOutlet UIButton *shakeButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _time = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(shakeTimer) userInfo:nil repeats:YES];
//    _time = [NSTimer scheduledTimerWithTimeInterval:1.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    }];
    [_time setFireDate:[NSDate distantFuture]];


}

- (void)shakeTimer{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)shakeAction:(UIButton *)sender {
    if (!sender.selected) {
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        [_time setFireDate:[NSDate distantPast]];
    }else{
        [sender setTitle:@"Shake" forState:UIControlStateNormal];
        [_time setFireDate:[NSDate distantFuture]];
    }
    
    sender.selected = !sender.selected;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
