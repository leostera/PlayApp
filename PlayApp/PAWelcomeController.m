//
//  PAWelcomeController.m
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import "PAWelcomeController.h"
#import "PASignUpController.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation PAWelcomeController {
    id<FBGraphUser> user;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)fbUser{
    self->user = fbUser;
    [self performSegueWithIdentifier:@"showSignUp" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    PASignUpController *signUpVC = segue.destinationViewController;
    signUpVC.user = self->user;
}

- (IBAction)showSignUp:(UIStoryboardSegue *)segue{
    // This method exists in order to create an unwind segue to this controller.
}

@end
