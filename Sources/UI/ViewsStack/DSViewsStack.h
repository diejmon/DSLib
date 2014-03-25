//
//  DSViewsStack.h
//  DSLib
//
//  Created by Alexander Belyavskiy on 3/25/14.
//  Copyright (c) 2014 DS ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DSViewsStackDelegate;
@protocol DSViewsStackDataSource;

@interface DSViewsStack : UIView
@property (nonatomic, weak) id<DSViewsStackDelegate> delegate;
@property (nonatomic, weak) id<DSViewsStackDataSource> dataSource;

- (NSUInteger)numberOfViews;
- (UIView *)viewForIndex:(NSUInteger)index;

- (void)reloadData;
@end
