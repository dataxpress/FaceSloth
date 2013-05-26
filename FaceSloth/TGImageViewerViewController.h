//
//  TGImageViewerViewController.h
//  FaceSloth
//
//  Created by Tim Gostony on 5/25/13.
//  Copyright (c) 2013 Tim Gostony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGImageViewerViewController : UIViewController

@property (nonatomic, retain) UIImage* image;
@property (nonatomic, retain) UIImage* renderedImage;

@property (retain, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)doneTapped:(id)sender;
- (IBAction)shareFacebookTapped:(id)sender;
- (IBAction)shareTwitterTapped:(id)sender;

@end
