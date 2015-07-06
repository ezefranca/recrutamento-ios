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
   
    showsArray = notification.object;
    
    _showTemp = [[NSMutableArray alloc]init];
    
    if (showsArray) {
        for (NSDictionary *showsFilter in showsArray) {
            
            self.showTK = [[Shows alloc] init];
            _showTK.nome = [showsFilter objectForKey:@"title"];
            _showTK.imagesURL = [[[showsFilter objectForKey:@"images"] objectForKey:@"poster"] objectForKey:@"thumb"];
            _showTK.ano = [showsFilter objectForKey:@"year"];
            [_showTemp addObject:self.showTK];
            NSLog(@"CCC %@", _showTemp);
        }
    }

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
    
    if (_showTemp) {
        
        TKCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        Shows *temp = [_showTemp objectAtIndex:indexPath.row];
        cell.showTitle.text = temp.nome;
        [cell.showImage sd_setImageWithURL:[NSURL URLWithString:temp.imagesURL] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        return cell;
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    Shows *temp = [_showTemp objectAtIndex:indexPath.row];
   
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:[NSURL URLWithString:temp.imagesURL]
                          options:0
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                            
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            if (image) {
                                NSString* titulo = [NSString stringWithFormat:@"%@\n%@", temp.nome, temp.ano];
                                JTAlertView *alertView = [[JTAlertView alloc] initWithTitle:titulo andImage:image];
                                alertView.size = CGSizeMake(280, 230);
                                [alertView addButtonWithTitle:@"OK" style:JTAlertViewStyleDefault action:^(JTAlertView *alertView) {
                                    [alertView hide];
                                }];
                                
                                [alertView show];
                            }
                        }];
    
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

