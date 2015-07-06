//
//  ViewController.m
//  BoldMovile
//
//  Created by Ezequiel França on 7/5/15.
//  Copyright (c) 2015 Ezequiel França. All rights reserved.
//

#import "ViewController.h"
#import "BoldMovile-Swift.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Shows *show = [[Shows alloc]init];
    show.nome = @"TESTE";
    show.ano = [NSNumber numberWithInt:1990];
    show.imagesURL = @"www";
    
    NSLog(@"%@", show);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
