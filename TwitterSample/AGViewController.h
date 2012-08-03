//
//  AGViewController.h
//  TwitterSample
//
//  Created by Mike Pattee on 8/3/12.
//  Copyright (c) 2012 Mike Pattee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray* tweets;
@property (nonatomic, weak) IBOutlet UITableView* tableView;

- (IBAction) loadTweets: (id) sender;

@end
