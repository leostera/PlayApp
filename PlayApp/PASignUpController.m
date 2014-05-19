//
//  PASignUpController.m
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import "PASignUpController.h"
#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@implementation PASignUpController {
    id<FBGraphUser>   user;
    CLLocationManager *locationManager;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [locationManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:[locations objectAtIndex:0] completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!(error))
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             [self.currentLocation setText:[NSString stringWithFormat:@"%@", placemark.locality]];
         }
     }];
}

- (void)viewDidLoad {
    // Set the username
    [self.username setText:[NSString stringWithFormat:@"%@ %@", [user first_name], [user last_name]]];

    // Set the picture
    self.userImage.profileID = [user id];
    [self.userImage clip];

    // Get location
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

- (void)setUser:(id<FBGraphUser>)fbUser {
    user = fbUser;
}

- (IBAction)handleStart:(id)sender {
    // set marker for first time
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstStart"];
    [self performSegueWithIdentifier:@"goToTable" sender:nil];
}

- (IBAction)goToTable:(UIStoryboardSegue *)segue {
    
}

@end
