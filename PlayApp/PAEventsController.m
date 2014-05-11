//
//  PAEventsController.m
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import "PAEventsController.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation PAEventsController {
    NSArray *events;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"EventsTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    NSObject* obj = [events objectAtIndex:indexPath.row];
    cell.textLabel.text = [obj valueForKeyPath:@"name"];
    cell.detailTextLabel.text = [obj valueForKeyPath:@"location"];
    NSString* pictureUrl = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", [obj valueForKeyPath:@"eid"]];
    NSData* rawData = [NSData dataWithContentsOfURL:[NSURL URLWithString:pictureUrl]];
    cell.imageView.image = [UIImage imageWithData:rawData];
    
    NSLog(@"%@", cell.detailTextLabel.text);
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *eventsURL = [NSURL URLWithString:@"http://playdoh.herokuapp.com/api/events.json"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:eventsURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    events = [dataDictionary objectForKey:@"events"];
}

@end
