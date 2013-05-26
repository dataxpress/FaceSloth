//
//  TGSlothRenderer.m
//  FaceSloth
//
//  Created by Tim Gostony on 5/25/13.
//  Copyright (c) 2013 Tim Gostony. All rights reserved.
//

#import <CoreImage/CoreImage.h>
#import <QuartzCore/QuartzCore.h>

#import "TGSlothRenderer.h"

@implementation TGSlothRenderer

-(void)renderSlothFacesOntoImage:(UIImage *)image completion:(void (^)(UIImage *))handler error:(void (^)(NSString *))errorHandler
{
    
    // main thread.
    
    CIImage* ciimage = [CIImage imageWithCGImage:image.CGImage];
    
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:@{CIDetectorAccuracy: CIDetectorAccuracyHigh}];
    
    NSArray* features = [detector featuresInImage:ciimage];

    
    if(features.count == 0)
    {
        errorHandler(@"Couldn't find any faces.  Try again with a picture at a better angle and/or with better lighting.");
        return;
    }
    
    for(CIFaceFeature* feature in features)
    {
        
    }
    
    
    
    
}

@end
