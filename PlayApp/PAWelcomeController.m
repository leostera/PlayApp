//
//  PAWelcomeController.m
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import "PAWelcomeController.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation PAWelcomeController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    // create global user object with this data
    NSLog(@"usr_id::%@",user.id);
    NSLog(@"usr_first_name::%@",user.first_name);
    NSLog(@"usr_middle_name::%@",user.middle_name);
    NSLog(@"usr_last_name::%@",user.last_name);
    NSLog(@"usr_username::%@",user.username);
    NSLog(@"usr_b_day::%@",user.birthday);
    
    // go to the sign-up view
}

@end
