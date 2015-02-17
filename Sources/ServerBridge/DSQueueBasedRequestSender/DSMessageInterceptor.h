//
//  DSMessageInterceptor.h
//  DSLib
//
//  Created by Alexander Belyavskiy on 3/30/14.
//  Copyright (c) 2014 DS ltd. All rights reserved.
//

@import Foundation;
#import "DSAlertsSupportCode.h"
#import "DSConstants.h"

@class DSWebServiceParams;

/** Can intercept only messages without params */
@interface DSMessageInterceptor : NSObject<NSCopying>
@property (nonatomic, strong) DSMessageDomain *domain;

/** You can set one code for domain */
@property (nonatomic, strong) DSMessageCode *code;
/** Or several codes for domain */
@property (nonatomic, strong) NSArray *codes;

- (void)setHandler:(ds_completion_handler)handler;
- (ds_completion_handler)handler;

- (void)excludeParamsFromInterception:(Class)params;
- (BOOL)shouldInterceptParams:(DSWebServiceParams *)params;
@end
