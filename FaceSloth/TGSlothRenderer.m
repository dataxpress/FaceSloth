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
    
    CGSize imageSize = image.size;
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(nil, imageSize.width, imageSize.height, CGImageGetBitsPerComponent(image.CGImage), 0, rgbColorSpace, CGImageGetBitmapInfo(image.CGImage));
    CGColorSpaceRelease(rgbColorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, imageSize.width, imageSize.height), image.CGImage);

    
    for(CIFaceFeature* feature in features)
    {
        float rotation = 0.0f; // 25 degrees
        
        if(feature.hasLeftEyePosition && feature.hasRightEyePosition)
        {
            float deltaY = feature.rightEyePosition.y - feature.leftEyePosition.y;
            float deltaX = feature.rightEyePosition.x - feature.leftEyePosition.x;
            rotation = atan2(deltaY, deltaX) * 180 / M_PI;
        }
        
        
        CGRect rect = feature.bounds;
        
        
        
        [self drawSlothInContext:context inRect:rect rotation:rotation];
    }
    
    // write out finished image
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    UIImage* img = [UIImage imageWithCGImage:imgRef];
    CGImageRelease(imgRef);

    handler(img);
    
    
    CGContextRelease(context);
    
}

float deg2rad(float deg)
{
    return deg * M_PI / 180.0f;
}

-(void)drawSlothInContext:(CGContextRef)context inRect:(CGRect)rect rotation:(float)rotation
{
    NSLog(@"Drawing sloth at %@",NSStringFromCGRect(rect));
    
    
    CGSize size = CGContextGetClipBoundingBox(context).size;
    
    int imageid = 1+(arc4random()%7);
    
    UIImage* slothFace = [UIImage imageNamed:[NSString stringWithFormat:@"slothface%d",imageid]];
    
    
    CGPoint facePosition = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    
    float xpos = facePosition.x / size.width;
    float ypos = facePosition.y / size.height;
    
    CGAffineTransform transform = CGAffineTransformIdentity;

    transform = CGAffineTransformRotate(transform, deg2rad(rotation));
    
    //translate context
    CGContextTranslateCTM( context, xpos * size.width, ypos * size.height ) ;
    
    // rotate context
    CGContextConcatCTM(context, transform);

    rect.origin.x = -rect.size.width / 2;
    rect.origin.y = -rect.size.height / 2;
    
    
    CGContextDrawImage(context, rect, slothFace.CGImage);
    
    // unrotate context 
    CGContextConcatCTM(context, CGAffineTransformRotate(CGAffineTransformIdentity, -deg2rad((rotation))));
    // untranslate
    CGContextTranslateCTM( context, -xpos * size.width, -ypos * size.height ) ;

    
    
}



@end
