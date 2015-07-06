//
//  ViewController.h
//  BoldMovile
//
//  Created by Ezequiel França on 7/5/15.
//  Copyright (c) 2015 Ezequiel França. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebserviceTK.h"

@interface ViewController : UIViewController  <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property  NSArray *showsArray;

@end

