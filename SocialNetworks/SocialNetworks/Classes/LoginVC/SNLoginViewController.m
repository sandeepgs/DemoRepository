//
//  SNLoginViewController.m
//  SocialNetworks
//
//  Created by Sandeep GS on 25/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SNLoginViewController.h"

@interface SNLoginViewController (Private)

- (void)customInitialization;
- (void)releaseAllViews;

@end

@implementation SNLoginViewController (Private)

- (void)customInitialization
{
    
}

- (void)releaseAllViews
{
    self.loginWebView = nil;
}

@end

@implementation SNLoginViewController

@synthesize loginWebView = mLoginWebView;
@synthesize loginType = mLoginType;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self customInitialization];
    }
    return self;
}

#pragma mark -
#pragma mark View Hierarchy

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavigationTitle];
}

- (void)viewDidUnload
{
    [self releaseAllViews];
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Instance Methods

- (void)setNavigationTitle
{
    switch (mLoginType) {
        case eFacebookLoginType     : self.navigationItem.title = @"Facebook";      break;
        case eTwitterLoginType      : self.navigationItem.title = @"Twitter";       break;
        case eLinkedInLoginType     : self.navigationItem.title = @"LinkedIn";      break;
        case eFoursquareLoginType   : self.navigationItem.title = @"Foursquare";    break;
        case eGoogleLoginType       : self.navigationItem.title = @"Google";        break;            
            
        default:
            break;
    }
}

- (void)setupForFacebook
{
    
}

- (void)setupForTwitter
{
    
}

- (void)setupForLinkedIn
{
    
}

- (void)setupForFoursquare
{
    
}

- (void)setupForGoogle
{
    
}

#pragma mark -
#pragma mark Webview Delegate Methods


#pragma mark -
#pragma mark Dealloc

- (void)dealloc
{
    [self releaseAllViews];
    
    [super dealloc];
}

@end