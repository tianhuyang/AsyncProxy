//
//  TLSSocket.h
//  AsyncProxy
//
//  Created by Huge on 6/19/22.
//  Copyright © 2022 Nikita Mordasov. All rights reserved.
//

#import "GCDAsyncSocket.h"

NS_ASSUME_NONNULL_BEGIN

@interface TLSSocket : NSObject <GCDAsyncSocketDelegate>

@property(strong, nonatomic) GCDAsyncSocket *tlsSocket;
- (void) connectToHost:(NSString*)host port:(uint16_t) port;
-(instancetype)initWithQueue:(dispatch_queue_t)queue;
@end

NS_ASSUME_NONNULL_END
