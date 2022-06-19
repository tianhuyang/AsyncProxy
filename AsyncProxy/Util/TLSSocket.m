//
//  TLSSocket.m
//  AsyncProxy
//
//  Created by Huge on 6/19/22.
//  Copyright © 2022 Nikita Mordasov. All rights reserved.
//

#import "TLSSocket.h"
#import "../APAsyncSocket.h"

static dispatch_queue_t tls_dispatch_queue = nil;

@implementation TLSSocket
@synthesize tlsSocket;

-(instancetype)initWithQueue:(dispatch_queue_t)queue
{
    self = [super init];
    if (tls_dispatch_queue == nil) {
        tls_dispatch_queue = dispatch_queue_create("AsyncProxy.queueTLSTCPClient", DISPATCH_QUEUE_SERIAL);
    }
    self.tlsSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:tls_dispatch_queue];
    return self;
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"startTLS: remoteHost=%@", sock.remoteHost);
    [sock startTLS:@{GCDAsyncSocketSSLPeerName: sock.remoteHost}];
}

- (void)socketDidSecure:(GCDAsyncSocket *)sock
{
    NSLog(@"socketDidSecure: remoteHost=%@", sock.remoteHost);
}

- (void) connectToHost:(NSString*)host port:(uint16_t) port
{
    tlsSocket.remoteHost = host;
    NSError *error;
    BOOL success = [tlsSocket connectToHost:host onPort:port error:&error];
    NSLog(@"connectToHost: error=%@, success=%@, connected=%@", error, success ? @"YES": @"NO", tlsSocket.isConnected ? @"YES": @"NO");
}

// protocol method on any TCP disconnection
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    //disconnect everything
    NSLog(@"socketDidDisconnect: remoteHost=%@, error=%@", sock.remoteHost, err);
}
@end
