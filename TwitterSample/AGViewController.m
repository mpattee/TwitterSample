//
//  AGViewController.m
//  TwitterSample
//
//  Created by Mike Pattee on 8/3/12.
//  Copyright (c) 2012 Mike Pattee. All rights reserved.
//

#import "AGViewController.h"

#import "AGTweetCell.h"

#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@implementation AGViewController
@synthesize tweets = mTweets;
@synthesize tableView = mTableView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTweets:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction) loadTweets: (id) sender
{
    
    ACAccountStore* store = [[ACAccountStore alloc] init];
    ACAccountType* twitterAccountType = [store accountTypeWithAccountTypeIdentifier: ACAccountTypeIdentifierTwitter];
    [store requestAccessToAccountsWithType: twitterAccountType withCompletionHandler: ^void( BOOL granted, NSError* error )
     {
         if( !granted )
         {
             NSLog(@"User rejected access to the account");
         }
         else
         {
             NSArray* twitterAccounts = [store accountsWithAccountType: twitterAccountType];
             if( [twitterAccounts count] > 0 )
             {
                 ACAccount* account = [twitterAccounts objectAtIndex: 0];
                 NSURL* url = [NSURL URLWithString: @"https://api.twitter.com/1/statuses/home_timeline.json"];
                 NSDictionary* parameters = [NSDictionary dictionaryWithObjectsAndKeys: @"1" , @"include_entities", nil];
                 TWRequest* request = [[TWRequest alloc] initWithURL: url parameters: parameters requestMethod: TWRequestMethodGET];
                 request.account = account;
                 [request performRequestWithHandler: ^void( NSData* responseData, NSHTTPURLResponse* urlResponse, NSError* error )
                  {
                      self.tweets = [NSJSONSerialization JSONObjectWithData: responseData options: NSJSONReadingMutableLeaves error: &error];
                      if( error )
                      {
                          NSLog(@"jsonError = %@", error);
                      }
                      [self.tableView reloadData];
                  }];
             }
             else
             {
                 NSLog(@"no twitter accounts on device");
             }
         }
     }];
}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView: (UITableView*) tableView numberOfRowsInSection: (NSInteger) section
{
    return [self.tweets count];
}

- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
    AGTweetCell* cell = [tableView dequeueReusableCellWithIdentifier: @"TweetCell"];
    NSDictionary* tweet = [self.tweets objectAtIndex: indexPath.row];
    cell.messageLabel.text = [tweet valueForKey: @"text"];
    cell.nameLabel.text = [[tweet valueForKey: @"user"] valueForKey: @"name"];
        NSData* imageData = [NSData dataWithContentsOfURL: [NSURL URLWithString: [tweet valueForKeyPath: @"user.profile_image_url"]]];
            cell.imageView.image = [UIImage imageWithData: imageData];
    return cell;
}


@end
