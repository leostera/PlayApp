//
//  PASignUpController.m
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import "PASignUpController.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation PASignUpController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    // Set the username
    [self.username setText:[NSString stringWithFormat:@"%@ %@", [self.user first_name], [self.user last_name]]];
    
    // Set the picture
    self.userImage.profileID = [self.user id];
    [self.userImage clip];
    
    // Set location
    // self.location
}

- (IBAction)goToTable:(id)sender {
    [self performSegueWithIdentifier:@"goToTable" sender:nil];
}

@end
