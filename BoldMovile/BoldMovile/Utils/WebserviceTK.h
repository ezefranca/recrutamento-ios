//
//  WebserviceTK.h
//  recrutamento-ios
//
//  Created by Ezequiel França on 7/4/15.
//  Copyright (c) 2015 Ezequiel França. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "BoldMovile-Swift.h"

#define API_ENDPOINT @"https://api-v2launch.trakt.tv/shows/popular?extended=images"
#define CLIENT_ID @"04ee94fc2290b14e148eb8ae3c369b6a18b4594bd07a69ae7eac13d830d8dc32"
#define CLIENT_SECRET @"5f6231765c62bebb84e15c4b8531d72f878c66783c8e77d3266faad086d3f317"

@interface WebserviceTK : NSObject

- (void) downloadShowsPopulares ;

@end
