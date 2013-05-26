//
//  TGViewController.m
//  FaceSloth
//
//  Created by Tim Gostony on 5/25/13.
//  Copyright (c) 2013 Tim Gostony. All rights reserved.
//

#import "TGViewController.h"

@interface TGViewController ()

@end

@implementation TGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePictureTapped:(id)sender {
    
    [self showPickerWithSource:UIImagePickerControllerSourceTypeCamera];
    
}

- (IBAction)choosePictureTapped:(id)sender {
    
    [self showPickerWithSource:UIImagePickerControllerSourceTypePhotoLibrary];
    
}

-(void)showPickerWithSource:(UIImagePickerControllerSourceType)source
{
    
    if([UIImagePickerController isSourceTypeAvailable:source] == NO)
    {
        [[[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Sorry, it looks like your device can't do that." delegate:nil cancelButtonTitle:@"Oh..." otherButtonTitles:nil] autorelease] show];
        return;
    }
    
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.delegate = self;
    
    imagePicker.sourceType = source;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
    [imagePicker release];
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"Info is %@",info);
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
