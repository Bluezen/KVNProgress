//
//  NSString+Utilities.m
//  KVNProgress
//
//  Created by Adrien Long on 30/06/2015.
//  Copyright (c) 2015 Pinch. All rights reserved.
//

#import "NSString+KVNTextSize.h"

@implementation NSString (KVNTextSize)

- (CGFloat)kvn_textHeightWithFont:(UIFont *)font andWitdhMax:(CGFloat)widthMAX
{
    if (self.length == 0 || !font) {
        return 0.0f;
    }
    NSDictionary *attributes = @{NSFontAttributeName: font};
    
    CGRect boundingRect = [self boundingRectWithSize:CGSizeMake(widthMAX, CGFLOAT_MAX)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attributes
                                             context:nil];
    
    //!\ cf doc of "boundingRectWithSize:options:attributes:contex:" method: returned value is fractional sizes; we must raise its value to the nearest higher integer using the ceil function.
    CGFloat height = 0.0f;
    if (boundingRect.size.height > 0.0f) {
        height = ceil(boundingRect.size.height);
    }
    return height;
}

@end
