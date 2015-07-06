//
//  WebserviceTK.m
//  recrutamento-ios
//
//  Created by Ezequiel França on 7/4/15.
//  Copyright (c) 2015 Ezequiel França. All rights reserved.
//

#import "WebserviceTK.h"

@implementation WebserviceTK

- (void) downloadShowsPopulares {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"trakt-api-version"];
    [manager.requestSerializer setValue:CLIENT_ID forHTTPHeaderField:@"trakt-api-key"];
    [manager GET:API_ENDPOINT parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.description);
        
    }];
    
}

@end
