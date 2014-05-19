//
//  PAWelcomeController.h
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface PAWelcomeController : UIViewController

- (IBAction)showSignUp:(UIStoryboardSegue *)segue;
- (IBAction)goToTable:(UIStoryboardSegue *)segue;

@end
