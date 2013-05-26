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

@property (nonatomic, retain) UIImage* originalImage;
@property (nonatomic, retain) UIImage* renderedImage;

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
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

-(void)renderFacesOnImage:(UIImage*)image
{
    
    self.originalImage = image;
    
    [self renderOriginal];

}

- (IBAction)redoTapped:(id)sender {
    [self renderOriginal];
}

-(void)renderOriginal
{
    
    // render the image
    TGSlothRenderer* renderer = [[TGSlothRenderer alloc] init];
    
    [renderer renderSlothFacesOntoImage:self.originalImage completion:^(UIImage *renderedImage) {
        self.renderedImage = renderedImage;
        self.imageView.image = self.renderedImage;
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
