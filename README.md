Here is a step by step guide to make adding the Buffer iOS SDK to your iOS app easy and straightforward. With the SDK you can present a Buffer Composer Sheet (similar to the Twitter sheet). You can trigger this from a button or using our UIActivity. Here we go:

![Buffer Login](http://cl.ly/image/0j0l0q2T1D3W/buffer2.jpg "Buffer Login")
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![Buffer Composer](http://cl.ly/image/1k3X3z3O1n27/buffer1.jpg "Buffer Composer")

## Features

* Easy Buffer Authentication if the user has Buffer for iPhone installed. http://cl.ly/image/0t1H0l3H2203
* iOS6 Native Twitter Authentication.  
* Offline Saving, if an update fails due to a network error the update will be saved and added to Buffer once connectivity is available again.


## How To Get Started

###Step 1: Download the Buffer SDK ###

You can download the Buffer SDK here: https://github.com/bufferapp/buffer-ios-sdk/archive/master.zip

You can watch/checkout the Buffer SDK from GitHub here: https://github.com/bufferapp/buffer-ios-sdk

###Step 2: Add the Buffer SDK to your Xcode Project###

- Open your Xcode project.
- Drag the BufferSDK folder within the Buffer SDK example project into your project, this contains the compiled framework along with image assets required by the SDK.

**In order to use the Buffer SDK your project also needs the following frameworks added to Link Binary With Libraries Build Phase...**
- AdSupport.framework
- libsqlite3.0.dylib
- Twitter.framework
- Accounts.framework
- Security.framework
- QuartzCore.framework
- SystemConfiguration.framework
- MobileCoreServices.framework
- CoreGraphics.framework
- [FacebookSDK.framework](https://github.com/facebook/facebook-ios-sdk)


###Step 3: Create a Buffer App###

Head over to the [http://bufferapp.com/developers/](Buffer Developers) section to create your Buffer App, it will provide you with all the details you need to continue setting up the Buffer SDK within your app.


###Step 4: Configure the Buffer SDK in your App Delegate###

You configure the Buffer SDK within your App Delegate.

####Import the BufferAPI Header####

At the top of your app delegate source file, you'll need to include the BufferAPI header. At the top of your class you should see other imports already. Just add this line:

	#import "BufferSDK.h"
   
You'll also need to include this wherever you call the BufferAPI object.

####Set Your Client ID and Client Secret####

The Buffer SDK requires the details of the Buffer App you set up in Step 4 in order to make requests to the Buffer API. Include the following lines in your `application:didFinishLaunchingWithOptions:` method adding your Client ID, Client Secret set up within Step 3.

    [[BufferSDK sharedAPI] setClientID:@"" andClientSecret:@""];


###Step 5: Add the Buffer URL scheme###

In order to authenticate with the Buffer API, Buffer for iPhone needs to open your app. If you haven't already add the `application:handleopenURL:` method to your App Delegate and include the following...

    [[BufferSDK sharedAPI] handleOpenURL:url];
    
You will now need to register a URL scheme to recieve the authentication callbacks. The SDK uses "buffer" plus your application's client ID you set up in Step 4. If for instance your Client ID is XXXX your URL scheme will be "bufferXXXX". If you have a URL scheme already for your app simply add it as another item.
    
To add a URL Scheme to your application, create a block like the one below in your Info.plist, updating it with the app’s scheme:

	▾ URL Types (Array)
		▾ Item 0 (Dictionary)
			  URL Identifier (String) com.buffer.sdk
			▾ URL Schemes (Array) (1 item)
				Item 0	(String) [YOUR URL SCHEME, for instance "bufferXXXX"]


###Step 6: Present the Buffer Sheet to the user###

You've now set up the Buffer SDK and can start presenting the Buffer Sheet in your app and start adding updates to Buffer.

There are two methods to present the Buffer Sheet. You can display the Buffer sheet modally or using the Buffer UIActivity. Both methods are detailed below...

####Modal Buffer Sheet####

We suggest you trigger the Buffer Sheet presentation via a user interaction, passing in the text that will pre-fill the sheet. Any code within the completion block will be called once an update has successfully posted as the modal is dismissed. 

    [BufferSDK presentBufferSheetWithText:@"This is a test." completionBlock:^(NSDictionary *response){
        NSLog(@"response %@", response);
    }];


####Buffer UIActivity####

The Buffer UIActivity can be used alongside other UIActivity's, when triggered the Buffer Sheet will be displayed. The UIActivity can be used with NSString or NSURL activity items.

    NSString *text = @"I'm using the Buffer SDK UIActivity";
    NSURL *url = [NSURL URLWithString:@"http://bufferapp.com/"];
    
    NSArray *activityItems = @[text, url];
    
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:@[ [BufferAPI bufferUIActivity] ]];

    [self presentViewController:activityView animated:YES completion:nil];
    

## Contact

We'd love to help with any questions you might have on this. Just drop us an email [api@bufferapp.com](mailto:api@bufferapp.com) any time.
