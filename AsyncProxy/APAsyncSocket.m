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

NSString const *RemoteHostKey = @"_remoteHost";
@dynamic remoteHost;

- (void)setRemoteHost:(NSString *)remoteHost
{
    objc_setAssociatedObject(self, &RemoteHostKey, remoteHost, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSString *)remoteHost
{
    return objc_getAssociatedObject(self, &RemoteHostKey);
}

@end
