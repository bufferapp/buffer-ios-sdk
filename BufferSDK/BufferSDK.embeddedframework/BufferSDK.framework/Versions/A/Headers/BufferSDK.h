//
//  BufferAPI.h
//  Buffer iOS SDK
//
//  Created by Andrew Yates on 29/11/2012.
//  Copyright (c) 2012 Buffer, Inc.
//

#define BUFFER_SDK_VERSION @"1.0"

@interface BufferAPI : NSObject {
    NSString *clientID;
    NSString *clientSecret;
    NSString *clientRedirectURI;
    NSString *service;
    id presentingView;
}

@property (nonatomic, retain) NSString *clientID;
@property (nonatomic, retain) NSString *clientSecret;
@property (nonatomic, retain) NSString *clientRedirectURI;
@property (nonatomic, retain) NSString *service;
@property (nonatomic, retain) id presentingView;

+(BufferAPI *)sharedAPI;
-(void)setClientID:(NSString *)appClientID AndClientSecret:(NSString *)appClientSecret;

-(void)handleOpenURL:(NSURL *)url;

+(void)presentBufferSheetWithText:(NSString *)text;
+(void)presentBufferSheetWithText:(NSString *)text completionBlock:(void (^)(NSDictionary *response))block;
+(void)presentBufferSheetWithText:(NSString *)text AndImageURL:(NSString *)url;
+(void)presentBufferSheetWithText:(NSString *)text AndImageURL:(NSString *)url completionBlock:(void (^)(NSDictionary *response))block;

+(void)setPresentingView:(id)view;

+(void)limitService:(NSString *)service;
+(void)resetServiceLimit;

+(UIActivity *)bufferUIActivity;

+(BOOL)isLoggedIn;
+(void)logout;

@end
