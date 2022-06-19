//
//  APAsyncSocket.h
//  AsyncProxy
//
//  Created by Huge on 6/19/22.
//  Copyright © 2022 Nikita Mordasov. All rights reserved.
//

#import "GCDAsyncSocket.h"

NS_ASSUME_NONNULL_BEGIN

@interface GCDAsyncSocket(AP)

// the remote host name if exists
@property (strong, nonatomic) NSString *remoteHost;

@end

NS_ASSUME_NONNULL_END
