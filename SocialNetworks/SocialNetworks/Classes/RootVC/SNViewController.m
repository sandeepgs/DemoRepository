//
//  SNViewController.m
//  SocialNetworks
//
//  Created by Sandeep GS on 25/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SNViewController.h"
#import "SNLoginViewController.h"

@interface SNViewController (Private)

- (void)customInitialization;
- (void)releaseAllViews;

@end

@implementation SNViewController (Private)

- (void)customInitialization
{
    mSocialNetworksArray = [[NSMutableArray alloc] initWithObjects:@"Facebook", @"Twitter", @"LinkedIn", @"Foursquare", @"Google", nil];
}

- (void)releaseAllViews
{
    self.socialListTableView = nil;
}

@end

@implementation SNViewController

@synthesize socialListTableView;

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customInitialization];
    }
    return self;
}

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
    
    self.navigationItem.title = @"Social Networks";
    
    UIView *emptyBGView = [[UIView alloc] initWithFrame:CGRectZero];
    [emptyBGView setBackgroundColor:[UIColor clearColor]];
    [socialListTableView setTableFooterView:emptyBGView];
    [emptyBGView release];
}

- (void)viewDidUnload
{
    [self releaseAllViews];
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark TableView Datasource/Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = [mSocialNetworksArray count];
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *socialListCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (socialListCell == nil) {
        socialListCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        [socialListCell setBackgroundColor:[UIColor clearColor]];
        [socialListCell setSelectionStyle:UITableViewCellSelectionStyleGray];
        [socialListCell.textLabel setTextColor:[UIColor darkTextColor]];
        [socialListCell.textLabel setBackgroundColor:[UIColor clearColor]];
        [socialListCell.textLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
    }
    
    [socialListCell.textLabel setText:[mSocialNetworksArray objectAtIndex:indexPath.row]];
    
    return socialListCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SNLoginViewController *loginViewController = [[SNLoginViewController alloc] initWithNibName:@"SNLoginViewController" bundle:[NSBundle mainBundle]];
    
    switch (indexPath.row) {
        case 0:
        {
            loginViewController.loginType = eFacebookLoginType;
            break;            
        }
        case 1:
        {
            loginViewController.loginType = eTwitterLoginType;
            break;            
        }
        case 2:
        {
            loginViewController.loginType = eLinkedInLoginType;
            break;            
        }
        case 3:
        {
            loginViewController.loginType = eFoursquareLoginType;
            break;            
        }
        case 4:
        {
            loginViewController.loginType = eGoogleLoginType;
            break;            
        }
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:loginViewController animated:YES];
    [loginViewController release];
}

#pragma mark -
#pragma mark Dealloc

- (void)dealloc
{
    [self releaseAllViews];
    
    [mSocialNetworksArray release];
    mSocialNetworksArray = nil;
    
    [super dealloc];
}

@end