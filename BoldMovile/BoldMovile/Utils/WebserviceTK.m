//
//  WebserviceTK.m
//  recrutamento-ios
//
//  Created by Ezequiel França on 7/4/15.
//  Copyright (c) 2015 Ezequiel França. All rights reserved.
//

#import "WebserviceTK.h"

@implementation WebserviceTK

@synthesize reposta;
- (NSArray*) downloadShowsPopulares{
    reposta = @[];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"trakt-api-version"];
    [manager.requestSerializer setValue:CLIENT_ID forHTTPHeaderField:@"trakt-api-key"];
    [manager GET:API_ENDPOINT parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    reposta = [[NSArray alloc]initWithArray:(NSArray *)responseObject];
   //     NSLog(@"%@", reposta);

    [[NSNotificationCenter defaultCenter] postNotificationName:@"DOWNLOADCOMPLETO" object:reposta];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.description);
    }];
     return reposta;
}

@end
