//
//  PAProfilePictureView.h
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface PAProfilePictureView : FBProfilePictureView

@property (nonatomic) float radius;

- (void)clip;

@end
