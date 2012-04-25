//
//  SNViewController.h
//  SocialNetworks
//
//  Created by Sandeep GS on 25/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNViewController : UIViewController
{
    NSMutableArray      *mSocialNetworksArray;
}

@property (nonatomic, retain) IBOutlet UITableView *socialListTableView;

@end