//
//  APAsyncSocket.m
//  AsyncProxy
//
//  Created by Huge on 6/19/22.
//  Copyright © 2022 Nikita Mordasov. All rights reserved.
//

#import "APAsyncSocket.h"
#import <objc/runtime.h>

@implementation GCDAsyncSocket(AP)

//NSString const *IsRemoteKey = @"_isRemote";
//@dynamic isRemote;
//
//- (void)setIsRemote:(BOOL)isRemote
//{
//    objc_setAssociatedObject(self, &IsRemoteKey, [NSNumber numberWithBool:isRemote], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    
//}
//
//- (BOOL)isRemote
//{
//    NSNumber *number = objc_getAssociatedObject(self, &IsRemoteKey);
//    return number.boolValue;
//}

@end
