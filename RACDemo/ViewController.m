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
    [self.name.rac_textSignal subscribeNext:^(NSString *new) {
        self.myModel.name = new;
    }];
    [self.email.rac_textSignal subscribeNext:^(NSString *new) {
        self.myModel.email = new;
    }];
    [self.username.rac_textSignal subscribeNext:^(NSString *new) {
        self.myModel.username = new;
    }];
    [self.github.rac_textSignal subscribeNext:^(NSString *new) {
        self.myModel.github = new;
    }];
    [[self.signup rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"Pressed");
    }];
    [[RACCommand commandWithCanExecuteSignal:
      [RACSignal combineLatest:@[
                                self.name.rac_textSignal,
                                self.email.rac_textSignal,
                                self.username.rac_textSignal]
                 reduce:^(NSString *name,NSString *email,NSString *username){
                                return @(name.length>0&&email.length&&username.length);
                                }]]
                subscribeNext:^(id x) {
                                                 
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
