//
//  BookAPI.h
//  BookORama
//
//  Created by Aditya Narayan on 6/3/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface BookAPI : NSObject

- (NSArray *)parseBook:(Book *)book;
- (NSMutableArray *)parsetext:(NSArray *)array forBook:(Book *)book;
- (NSMutableArray *)parseImages:(NSArray *)array forBook:(Book *)book;

@end
