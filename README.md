The Buffer iOS SDK allows you to add Buffer to your iOS app with relative ease. The SDK allows you to present a Buffer Composer Sheet from a button action or using our UIActivity. If an update fails depending on the error it'll be saved into an offline queue to be sent later.

If the user has the Buffer iPhone app intalled on their device, it'll be opened automatically when the user opens the Buffer Composer Sheet for the first time to authenticate your app to access Buffer. If the user doesn't have Buffer for iPhone installed they'll be taken to Safari to complete the normal OAuth2 login before being redirected back to your app.

## How To Get Started

###Step 1: Download the Buffer SDK Framework ###

You can download the Buffer SDK here:

You can watch/checkout the Buffer SDK from GitHub here:

###Step 2: Add the Buffer SDK to your Xcode Project###

- Open your Xcode project.
- Drag the BufferSDK.embeddedframework folder within the Buffer SDK example project into your project.
- Add BufferSDK.framework to your Link Binary With Libraries Build Phase.

###Step 3: Create a Buffer App###

Head over to the [http://bufferapp.com/developers/](Buffer Developers) section to create your Buffer App, it will provide you with all the details you need to continue setting up the Buffer SDK within your app.

###Step 4: Configure the Buffer SDK in your App Delegate###

You configure the Buffer SDK within your App Delegate.

####Import the BufferAPI Header####

At the top of your app delegate source file, you'll need to include the BufferAPI header. At the top of your class you should see other imports already. Just add this line:

	#import <BufferSDK/BufferSDK.h>
    
You'll also need to include this wherever you call the BufferAPI object.

####Set Your Client ID and Client Secret####

The Buffer SDK requires the details of the Buffer App you set up in Step 4 in order to make requests to the Buffer API. Include the following lines in your `application:didFinishLaunchingWithOptions:` method adding your Client ID, Client Secret set up within Step 3.

    [[BufferAPI sharedAPI] setClientID:@"" AndClientSecret:@""];


###Step 5: Add the Buffer URL scheme###

In order to authenticate with the Buffer API, Buffer for iPhone needs to open your app. If you haven't already add the `application:handleopenURL:` method to your App Delegate and include the following...

    [[BufferSDK sharedAPI] handleOpenURL:url];
    
You will now need to register a URL scheme to recieve the authentication callbacks. The SDK uses "bufferappauth" plus your application's client ID you set up in Step 4. If for instance your Client ID is XXXXXXXXXX your URL scheme will be "bufferappauthXXXXXXXXXX". If you have a URL scheme already for your app simply add it as another item.
    
To add a URL Scheme to your application, create a block like the one below in your Info.plist, updating it with the app’s scheme:

	▾ URL Types (Array)
		▾ Item 0 (Dictionary)
			  URL Identifier (String) com.getpocket.sdk
			▾ URL Schemes (Array) (1 item)
				Item 0	(String) [YOUR URL SCHEME, for instance "bufferappauthXXXXXXXXXX"]


###Step 6: Present the Buffer Sheet to the user###

You've now set up the Buffer SDK and can start presenting the Buffer Sheet in your app and start adding updates to Buffer.

There are two methods to present the Buffer Sheet. You can display the Buffer sheet modally or using the Buffer UIActivity. Both methods are detailed below...

####Modal Buffer Sheet####

We suggest you trigger the Buffer Sheet presentation via a user interaction, passing in the text that will pre-fill the sheet. Any code within the completion block will be called once an update has successfully posted as the modal is dismissed. 

    [BufferAPI presentBufferSheetWithText:@"This is a test." withinView:self completionBlock:^(NSDictionary *response){
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

Got a question about the SDK? [Drop us an email](mailto:api@bufferapp.com).
