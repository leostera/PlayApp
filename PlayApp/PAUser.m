//
//  PAUser.m
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import "PAUser.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Foundation/Foundation.h>

@implementation PAUser {
    NSString* accessToken;
}

- (NSString*) getToken {
    accessToken = [[[FBSession activeSession] accessTokenData] accessToken];
    return accessToken;
}

- (void) registerUser {
    NSString* urlString = @"http://192.168.1.101:3000/users";
    NSString* jsonString = [NSString stringWithFormat:@"{\"token\":%@}", accessToken];
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
    NSError* error = nil;
    responseData = [NSURLConnection sendSynchronousRequest:request     returningResponse:&response error:&error];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"the final output is:%@",responseString);
}

@end
