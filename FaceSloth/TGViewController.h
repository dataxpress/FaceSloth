//
//  TGViewController.h
//  FaceSloth
//
//  Created by Tim Gostony on 5/25/13.
//  Copyright (c) 2013 Tim Gostony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
- (IBAction)takePictureTapped:(id)sender;
- (IBAction)choosePictureTapped:(id)sender;

@end
