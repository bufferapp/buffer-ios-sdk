Pod::Spec.new do |s|
    s.name         = 'BufferSDK'
    s.version      = '1.0'
    s.license      = 'MIT'
    s.summary      = 'An Objective-C SDK for Buffer. Including a UIActivity which uses Safari or the Buffer iPhone app for authentication.'
    s.homepage     = 'http://bufferapp.com/
    s.author       = 'Andrew Yates'
    s.source       = { :git => 'git://github.com/bufferapp/buffer-objc-sdk.git', :tag => 'v1.0' }
    s.source_files = 'SDK/**/*.{h,m}'
    s.frameworks = 'Foundation', 'Security'
    s.requires_arc = true
end