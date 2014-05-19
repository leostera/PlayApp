//
//  PASignUpController.h
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>
#import "PAProfilePictureView.h"

@interface PASignUpController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *currentLocation;
@property (weak, nonatomic) IBOutlet PAProfilePictureView *userImage;

- (void)setUser:(id<FBGraphUser>)user;

- (IBAction)handleStart:(id)sender;
- (IBAction)goToTable:(UIStoryboardSegue *)segue;

@end
