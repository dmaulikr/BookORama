//
//  Book.h
//  BookORama
//
//  Created by Aditya Narayan on 6/3/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookAPI.h"

@interface Book : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * author;
@property (nonatomic, strong) NSArray * contentText;
@property (nonatomic, strong) NSArray * bookContextImages;

@end
