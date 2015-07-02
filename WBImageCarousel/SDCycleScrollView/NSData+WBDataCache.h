//
//  NSData+WBDataCache.h
//  WBImageCarousel
//
//  Created by 李伟宾 on 15/6/24.
//  Copyright (c) 2015年 李伟宾. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData (WBDataCache)

- (void)saveDataCacheWithIdentifier:(NSString *)identifier;

+ (NSData *)getDataCacheWithIdentifier:(NSString *)identifier;

+ (void)clearCache;

@end
