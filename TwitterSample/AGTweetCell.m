//
//  AGTweetCell.m
//  TwitterSample
//
//  Created by Mike Pattee on 8/3/12.
//  Copyright (c) 2012 Mike Pattee. All rights reserved.
//

#import "AGTweetCell.h"

@implementation AGTweetCell
@synthesize nameLabel = mNameLabel;
@synthesize messageLabel = nMessageLabel;
@synthesize imageView = mImageView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
