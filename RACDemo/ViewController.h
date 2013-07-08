//
//  ViewController.h
//  RACDemo
//
//  Created by Mario on 08/07/13.
//  Copyright (c) 2013 Mario. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MyModel.h"

@interface ViewController : UIViewController

@property (nonatomic,retain) MyModel *myModel;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *github;
@property (weak, nonatomic) IBOutlet UIButton *signup;

@end
