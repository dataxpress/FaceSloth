//
//  TGSlothRenderer.h
//  FaceSloth
//
//  Created by Tim Gostony on 5/25/13.
//  Copyright (c) 2013 Tim Gostony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGSlothRenderer : NSObject

/* Renders sloth face in background.  Calls handler on foreground thread. */
-(void)renderSlothFacesOntoImage:(UIImage*)image completion:(void(^)(UIImage* renderedImage))handler error:(void(^)(NSString* error))errorHandler;

@end
