//
//  AGTweetCell.h
//  TwitterSample
//
//  Created by Mike Pattee on 8/3/12.
//  Copyright (c) 2012 Mike Pattee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGTweetCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel* nameLabel;
@property (nonatomic, weak) IBOutlet UILabel* messageLabel;
@property (nonatomic, weak) IBOutlet UIImageView* imageView;

@end
