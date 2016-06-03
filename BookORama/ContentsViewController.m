//
//  ContentsViewController.m
//  BookORama
//
//  Created by Aditya Narayan on 6/3/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import "ContentsViewController.h"

@interface ContentsViewController ()

@property (nonatomic, assign) int counter;
@property (nonatomic, strong) NSArray *imagesArray;

@end

@implementation ContentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.counter = 0;
    [self displayBookData];
}


- (void)displayBookData {
//    NSLog(@"%@",self.book.bookContextImages[self.counter]);
//    NSURL *url = [NSURL URLWithString:self.book.bookContextImages[self.counter]];
//    NSData *data = [[NSData alloc] initWithContentsOfURL: url];
    self.imagesArray = [NSArray arrayWithObjects: [UIImage imageNamed:@"image1"], [UIImage imageNamed:@"image2"], [UIImage imageNamed:@"image3"], [UIImage imageNamed:@"image4"], [UIImage imageNamed:@"image5"], [UIImage imageNamed:@"image6"], [UIImage imageNamed:@"image7"], nil];
    //    NSArray * imagesArray = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"image1"], [UIImage imageNamed:@"image2"], [UIImage imageNamed:@"image3"], [UIImage imageNamed:@"image4"], [UIImage imageNamed:@"image5"], [UIImage imageNamed:@"image6"], [UIImage imageNamed:@"image7"], nil];
    

    
                                    
                                    
                                    
//                                    ]WithObjects: [UIImage imageNamed:@"image1"], [UIImage imageNamed:@"image2"], [UIImage imageNamed:@"image3"], [UIImage imageNamed:@"image4"], [UIImage imageNamed:@"image5"], [UIImage imageNamed:@"image6"], [UIImage imageNamed:@"image7"], nil];
//    NSArray * imagesArray = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"image1"], [UIImage imageNamed:@"image2"], [UIImage imageNamed:@"image3"], [UIImage imageNamed:@"image4"], [UIImage imageNamed:@"image5"], [UIImage imageNamed:@"image6"], [UIImage imageNamed:@"image7"], nil];
    
    self.picture.image = self.imagesArray[self.counter];
    self.pageText.text  = self.book.contentText[self.counter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)turnPage:(id)sender {
    
    if (self.counter < [self.book.contentText count] -1) {
        self.counter++;
        [self displayBookData];
    }
    else {
        self.pageText.text = @"The End";
        self.picture.image = [UIImage imageNamed:@"Book-O-Rama Logo"];
    }
}

@end
