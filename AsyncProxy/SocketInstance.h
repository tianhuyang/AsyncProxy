//
//  SocketInstance.h
//  AsyncProxy
//
//  Created by Nikita Mordasov on 1/4/15.
//  Copyright (c) 2015 Nikita Mordasov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"
#import "GCDAsyncUdpSocket.h"

extern const int STATE_INTIAL;
extern const int STATE_TLS;
extern const int STATE_TUNNEL;
extern const int STATE_STREAM;

@interface SocketInstance : NSObject <GCDAsyncSocketDelegate, GCDAsyncUdpSocketDelegate>
@property BOOL boolAbort;
@property int intTrafficIn;
@property int intTrafficOut;

- (BOOL)isDisconnected;
- (void)updateClientSocket: (GCDAsyncSocket *) socket andHostname: (NSString *) hostString andPort: (int) portNumber;
- (void)disconnectNow;
- (instancetype)initWithQueue: (dispatch_queue_t) queue;

@property NSString *tunnelHost;
@property uint16_t tunnelPort;

@property NSString *remoteHost;
@property uint16_t remotePort;

@property BOOL useTLS;
@property BOOL useTunnel;

@property int state;

- (void)setupProxyHost:(NSString*) host port:(uint16_t) port useTLS:(BOOL) useTLS;
- (BOOL)connectToHost:(NSString*)host onPort:(uint16_t)port error:(NSError **)errPtr;

@end
