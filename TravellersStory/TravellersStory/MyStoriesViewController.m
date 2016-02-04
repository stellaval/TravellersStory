//
//  MytStoriesViewController.m
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "MyStoriesViewController.h"
#import "MyStoriesTableViewCell.h"
#import "MyStory.h"


@interface MyStoriesViewController ()

@end

@implementation MyStoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSDateComponents *dateComponentsFrom = [[NSDateComponents alloc] init];
    dateComponentsFrom.year   = 2012;
    dateComponentsFrom.month  = 8;
    dateComponentsFrom.day    = 12;
    NSDate *dateFrom = [[NSCalendar currentCalendar] dateFromComponents:dateComponentsFrom];
    
    NSDateComponents *dateComponentsTo = [[NSDateComponents alloc] init];
    dateComponentsTo.year   = 2012;
    dateComponentsTo.month  = 8;
    dateComponentsTo.day    = 12;
    NSDate *dateTo = [[NSCalendar currentCalendar] dateFromComponents:dateComponentsTo];
    
    self.myStories = [NSArray arrayWithObjects:
                        
                        [MyStory myStoryWithTitle:@"Vacation in Lefkada"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://www.odans-travel.com//img/PROGRAMI/BIG_ekskurzia_porto_kaciki_lefkada_1416910147550.jpg"],
                        
                        [MyStory myStoryWithTitle:@"3 Days in Rome"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://static1.squarespace.com/static/533a4baae4b01b10be99195f/t/540f31c8e4b0b6aef5c7a1e0/1410281928794/Rome-Italy_2501454b.jpg?format=1500w"],
                        
                        [MyStory myStoryWithTitle:@"Paris the city of love"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://www.meininger-hotels.com/typo3temp/pics/5576e705b9.jpg"],
                      
                        [MyStory myStoryWithTitle:@"3 Days in Rome"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://static1.squarespace.com/static/533a4baae4b01b10be99195f/t/540f31c8e4b0b6aef5c7a1e0/1410281928794/Rome-Italy_2501454b.jpg?format=1500w"],
                      
                        [MyStory myStoryWithTitle:@"Vacation in Lefkada"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://www.odans-travel.com//img/PROGRAMI/BIG_ekskurzia_porto_kaciki_lefkada_1416910147550.jpg"],
                      
                        [MyStory myStoryWithTitle:@"Paris the city of love"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://www.meininger-hotels.com/typo3temp/pics/5576e705b9.jpg"],
                        nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.myStories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"myStoriesCell";
    
    UITableViewCell *originalCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(![originalCell isKindOfClass:[MyStoriesTableViewCell class]] || originalCell == nil) {
        originalCell = [[[NSBundle mainBundle] loadNibNamed:@"MyStoriesTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    
    MyStoriesTableViewCell *cell = (MyStoriesTableViewCell*) originalCell;
    
    MyStory *story = [self.myStories objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = story.title;
    
    NSDate *dateFrom = story.dateFrom;
    NSDate *dateTo = story.dateTo;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    
    NSString *dateFromString = [dateFormatter stringFromDate:dateFrom];
    NSString *dateToString = [dateFormatter stringFromDate:dateTo];
    
    NSMutableString *dateFromTo = [[NSMutableString alloc]init];
    [dateFromTo appendString:dateFromString];
    [dateFromTo appendString:@" - "];
    [dateFromTo appendString:dateToString];
    
    cell.datesLabel.text = dateFromTo;
    
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: story.imageUrl]]];
    
    
    
    cell.cellImageView.frame = CGRectMake(0,0, 100, 100);
   
    cell.cellImageView.image = img;
    
    [cell setBackgroundColor:[UIColor colorWithRed:0.98 green:0.95 blue:0.93 alpha:1.0]];
    
    [cell.contentView.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    [cell.contentView.layer setBorderWidth:3.0f];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end