//
//  ViewController.m
//  RACDemo
//
//  Created by Mario on 08/07/13.
//  Copyright (c) 2013 Mario. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if(self.myModel == nil) self.myModel = [MyModel new];
    [self.signup setEnabled:NO];
    [self makeViewReactive];
}

- (void)makeViewReactive {
    [self.name.rac_textSignal subscribe:RACBind(self.myModel.name)];
    [self.email.rac_textSignal subscribe:RACBind(self.myModel.email)];
    [self.username.rac_textSignal subscribe:RACBind(self.myModel.username)];
    [self.github.rac_textSignal subscribe:RACBind(self.myModel.github)];
    [[self.signup rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"Pressed");
    }];
    RAC(self.signup, enabled) = [RACSignal combineLatest:@[
                                    self.name.rac_textSignal,
                                    self.email.rac_textSignal,
                                    self.username.rac_textSignal]
                                reduce:^(NSString *name,NSString *email,NSString *username){
                                    return @(name.length>0&&email.length&&username.length);
                                }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
