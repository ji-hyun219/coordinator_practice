import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController
    
    let nativeChannel = FlutterMethodChannel(name: "com.jihyun/goToNative",
                                            binaryMessenger: flutterViewController.binaryMessenger)
    nativeChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: FlutterResult) -> Void in
          guard call.method == "goToNative" else {
              result(FlutterMethodNotImplemented)
              return
          }
        result("success")
    })
    
    GeneratedPluginRegistrant.register(with: self)
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
