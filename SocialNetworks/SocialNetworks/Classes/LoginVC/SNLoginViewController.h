//
//  SNLoginViewController.h
//  SocialNetworks
//
//  Created by Sandeep GS on 25/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    eFacebookLoginType,
    eTwitterLoginType,
    eLinkedInLoginType,
    eFoursquareLoginType,
    eGoogleLoginType
    
}SNLoginType;

@interface SNLoginViewController : UIViewController
{
    SNLoginType     mLoginType;
}

@property (nonatomic, retain) IBOutlet UIWebView *loginWebView;
@property (nonatomic, assign) SNLoginType loginType;

#pragma mark -
#pragma mark Instance Methods

- (void)setNavigationTitle;
- (void)setupForFacebook;
- (void)setupForTwitter;
- (void)setupForLinkedIn;
- (void)setupForFoursquare;
- (void)setupForGoogle;

@end