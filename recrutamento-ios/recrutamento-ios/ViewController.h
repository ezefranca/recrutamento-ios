//
//  ViewController.h
//  recrutamento-ios
//
//  Created by Ezequiel França on 7/4/15.
//  Copyright (c) 2015 Ezequiel França. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collection;

@end

