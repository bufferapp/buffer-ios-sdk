//
//  BufferSDK.h
//  BufferSDK
//
//  Created by Andrew Yates on 14/05/2013.
//  Copyright (c) 2013 Andrew Yates. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BUFFER_SDK_VERSION @"1.3.2"

@interface BufferSDK : NSObject {
    NSString *clientID;
    NSString *clientSecret;
    NSString *clientRedirectURI;
    NSString *service;
    NSString *resourcePath;
    BOOL shouldShortenURLS;
    id presentingView;
}

@property (nonatomic, retain) NSString *clientID;
@property (nonatomic, retain) NSString *clientSecret;
@property (nonatomic, retain) NSString *clientRedirectURI;
@property (nonatomic, retain) NSString *service;
@property (nonatomic, retain) NSString *resourcePath;
@property (nonatomic) BOOL shouldShortenURLS;
@property (nonatomic, retain) id presentingView;

+(BufferSDK *)sharedAPI;

// Configuration
- (void)setClientID:(NSString *)appClientID andClientSecret:(NSString *)appClientSecret;
- (void)setResourceBundlePath:(NSString *)path;
- (void)shouldShortenURLS:(BOOL)enabled;
+ (NSString *)bufferSDKResourceBundlePath;

// Handle Authentication
- (BOOL)handleOpenURL:(NSURL *)url;

// Presentation
+ (void)presentBufferSheetWithText:(NSString *)text;
+ (void)presentBufferSheetWithText:(NSString *)text completionBlock:(void (^)(NSDictionary *response))block;
+ (void)presentBufferSheetWithText:(NSString *)text andImageURL:(NSString *)url;
+ (void)presentBufferSheetWithText:(NSString *)text andImageURL:(NSString *)url completionBlock:(void (^)(NSDictionary *response))block;

+ (void)setPresentingView:(id)view;

// UIActivity
+ (UIActivity *)bufferUIActivity;

// Limit the service profiles the Composer displays.
+ (void)limitService:(NSString *)service;
+ (void)resetServiceLimit;

// Authentication Methods
+ (BOOL)isLoggedIn;
+ (void)logout;

@end
