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
    
    NSError* error = nil;
    
    NSDictionary *dict = @{
        @"auth_token" : [[[FBSession activeSession] accessTokenData] accessToken]
    };
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:dict];
    
    NSString* urlString = @"http://192.168.1.101:3000/users";
    NSString* jsonString = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //NSString* UUID = [[NSUUID UUID] UUIDString];
    NSData* responseData = nil;
    NSURL *url=[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    responseData = [NSMutableData data] ;
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    NSString *bodydata=[NSString stringWithFormat:@"data=%@",jsonString];
    
    [request setHTTPMethod:@"POST"];
    NSData *req=[NSData dataWithBytes:[bodydata UTF8String] length:[bodydata length]];
    [request setHTTPBody:req];
    NSURLResponse* response;

    responseData = [NSURLConnection sendSynchronousRequest:request     returningResponse:&response error:&error];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"the final output is:%@",responseString);
    
    NSURL *eventsURL = [NSURL URLWithString:@"http://playdoh.herokuapp.com/api/events.json"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:eventsURL];
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    events = [dataDictionary objectForKey:@"events"];
}

@end
