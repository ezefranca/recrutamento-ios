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
@synthesize showsArray;
#pragma mark - Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(downloadCompleto:)
                                                       name:@"DOWNLOADCOMPLETO" object:showsArray];

    WebserviceTK* wbTK = [[WebserviceTK alloc]init];
    [wbTK downloadShowsPopulares];
    Shows *show = [[Shows alloc]init];
    show.nome = @"TESTE";
    show.ano = [NSNumber numberWithInt:1990];
    show.imagesURL = @"www";

    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)downloadCompleto : (NSNotification *)notification{
   // NSLog(@"AAA %@", notification.object);
    showsArray = notification.object;
   // NSLog(@"BBB %@", showsArray);
    [_collection reloadData];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView DataSource Methods

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    if (showsArray) {
        for (NSDictionary *showsFilter in showsArray) {
            
            self.showTK = [[Shows alloc] init];
            _showTK.nome = [showsFilter objectForKey:@"title"];
            _showTK.imagesURL = [[[showsFilter objectForKey:@"images"] objectForKey:@"poster"] objectForKey:@"thumb"];
            NSLog(@"CCC %@", _showTK.nome);
        }
        TKCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        cell.showTitle.text = _showTK.nome;
        return cell;
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (showsArray) {
        return showsArray.count;
    }else {
    return 9;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0,0,0,-10);
}

@end

