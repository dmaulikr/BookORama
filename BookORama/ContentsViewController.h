//
//  ContentsViewController.h
//  BookORama
//
//  Created by Aditya Narayan on 6/3/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

@interface ContentsViewController : UIViewController

@property (nonatomic, strong) Book *book;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UITextView *pageText;
- (IBAction)turnPage:(id)sender;

@end
