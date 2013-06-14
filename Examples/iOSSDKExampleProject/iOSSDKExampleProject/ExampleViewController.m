//
//  ExampleViewController.m
//  iOSSDKExampleProject
//
//  Created by Andrew Yates on 05/06/2013.
//  Copyright (c) 2013 Andrew Yates. All rights reserved.
//

#import "ExampleViewController.h"
#import "BufferSDK.h"

@implementation ExampleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Normal Presentation";
}

-(IBAction)bufferButtonTapped:(id)sender {
    [BufferSDK presentBufferSheetWithText:@"This is a test." completionBlock:^(NSDictionary *response){
        NSLog(@"response %@", response);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
