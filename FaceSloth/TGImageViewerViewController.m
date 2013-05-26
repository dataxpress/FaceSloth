//
//  TGImageViewerViewController.m
//  FaceSloth
//
//  Created by Tim Gostony on 5/25/13.
//  Copyright (c) 2013 Tim Gostony. All rights reserved.
//

#import "TGImageViewerViewController.h"
#import "TGSlothRenderer.h"

@interface TGImageViewerViewController ()

@end

@implementation TGImageViewerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // render the image
    TGSlothRenderer* renderer = [[TGSlothRenderer alloc] init];
    
    [renderer renderSlothFacesOntoImage:self.image completion:^(UIImage *renderedImage) {
        self.imageView.image = renderedImage;
    } error:^(NSString *error) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        [[[[UIAlertView alloc] initWithTitle:@"Error" message:error delegate:nil cancelButtonTitle:@"Oh..." otherButtonTitles:nil] autorelease] show];
        
    }];
    
    [renderer release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [_renderedImage release];
    [_imageView release];
    [_image release];
    [super dealloc];

}

- (IBAction)doneTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)shareFacebookTapped:(id)sender {
    
    
}

- (IBAction)shareTwitterTapped:(id)sender {
    
    
}
@end
