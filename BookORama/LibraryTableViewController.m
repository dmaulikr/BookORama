//
//  LibraryTableViewController.m
//  BookORama
//
//  Created by Aditya Narayan on 6/3/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import "LibraryTableViewController.h"
#import "Book.h"
#import "TableViewCell.h"
#import "ContentsViewController.h"

@interface LibraryTableViewController ()

@property (nonatomic, strong) NSMutableArray *arrayOfBooks;

@end

@implementation LibraryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Book * buzzbeez = [[Book alloc]init];
    buzzbeez.title = @"BuzzyBee";
    buzzbeez.author = @"CJ Conrad";
    buzzbeez.contentText = [buzzbeez parsetext:[buzzbeez parseBook:buzzbeez] forBook:buzzbeez];
    buzzbeez.bookContextImages = [buzzbeez parseImages:[buzzbeez parseBook:buzzbeez] forBook:buzzbeez];
    
    UINib * nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"Cell"];
    
    self.arrayOfBooks = [NSMutableArray new];
    
    NSString *dataUrl = @"https://www.googleapis.com/books/v1/volumes?q=alphabet";
    NSURL *url = [NSURL URLWithString:dataUrl];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL: url completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error ) {
        
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
        
            if (error == nil) {
                // json to dictionary
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
                NSArray *items = json[@"items"];
                
                // parse json for title author info
                for (NSDictionary *item in items) {
                    NSString *title = item[@"volumeInfo"][@"title"];
                    NSString *author = item[@"volumeInfo"][@"authors"][0];
                    Book * newBook = [[Book alloc] init];
                    
                    newBook.title = title;
                    newBook.author = author;
                    
                    [self.arrayOfBooks addObject:newBook];
                    
                    NSLog(@"%@ - %@", title, author);
                }
            }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.arrayOfBooks addObject:buzzbeez];
            [self.tableView reloadData];
        });
//        }];
    }];
    [dataTask resume];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrayOfBooks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Book * book = self.arrayOfBooks[indexPath.row];
    
    cell.titleLabel.text = book.title;
    cell.authorLabel.text = book.author;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Book * book = self.arrayOfBooks[indexPath.row];

    [self performSegueWithIdentifier:@"showContext" sender:book];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showContext"]) {
        ContentsViewController *contents = (ContentsViewController*)segue.destinationViewController;
        contents.book = sender;
    }
}


@end
