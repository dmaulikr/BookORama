//
//  Book.m
//  BookORama
//
//  Created by Aditya Narayan on 6/3/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import "Book.h"

@implementation Book

- (NSArray *)parseBook:(Book *)book {
    
    NSString * bookAPI = [[NSString alloc] initWithContentsOfFile:[NSString stringWithFormat:@"/Users/adityanarayan/dev/ttt/Objective-C/Hackathon/BookORama/BookORama/%@.csv", book.title] encoding:NSUTF8StringEncoding error:nil];
    
    NSArray * rows = [bookAPI componentsSeparatedByString:@"\n"];
    
    return rows;
}

- (NSMutableArray *)parsetext:(NSArray *)array forBook:(Book *)book {
    
    NSMutableArray * bookText = [NSMutableArray array];
    
    array = [self parseBook:book];
    
    for (NSString * row in array) {
        NSArray * columns = [row componentsSeparatedByString:@","];
        [bookText addObject:columns[0]];
    }
    return bookText;
}


- (NSMutableArray *)parseImages:(NSArray *)array forBook:(Book *)book {
    
    NSMutableArray * bookImages = [NSMutableArray array];
    
    array = [self parseBook:book];
    
    for (NSString * row in array) {
        NSArray * columns = [row componentsSeparatedByString:@","];
        [bookImages addObject:columns[1]];
    }
    return bookImages;
}


@end
