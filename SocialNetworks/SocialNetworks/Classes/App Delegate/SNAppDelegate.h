//
//  SNAppDelegate.h
//  SocialNetworks
//
//  Created by Sandeep GS on 25/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SNViewController;

@interface SNAppDelegate : UIResponder <UIApplicationDelegate>
{
    
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) SNViewController *viewController;

@end