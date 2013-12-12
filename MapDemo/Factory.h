//
//  factory.h
//  MapDemo
//
//  Created by casa on 13-12-12.
//  Copyright (c) 2013年 casa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
@property (nonatomic, strong) NSMutableArray *polygonArray;
@property (nonatomic, strong) NSMutableArray *pathArray;
@property (nonatomic, strong) NSMutableArray *nameArray;
- (void)decodedData;
@end
