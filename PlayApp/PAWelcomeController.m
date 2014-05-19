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

- (void) loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"firstTime"]) {
        [self performSegueWithIdentifier:@"goToTable" sender:nil];
    }
    
}

- (void) loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstTime"];
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)fbUser{
    user = fbUser;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"firstTime"]) {
        [defaults setBool:NO forKey:@"firstTime"];
        [self performSegueWithIdentifier:@"showSignUp" sender:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@",[segue identifier]);
    if ([[segue identifier]isEqualToString:@"showSignUp"]) {
        PASignUpController *signUpVC = segue.destinationViewController;
        [signUpVC setUser:user];
    } else {

    }
}

- (IBAction)showSignUp:(UIStoryboardSegue *)segue{
    // This method exists in order to create an unwind segue to this controller.
}

@end
