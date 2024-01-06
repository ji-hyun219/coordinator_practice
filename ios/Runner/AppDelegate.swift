import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
//  private var mainCoordinator: AppCoordinator?
    private var navigationController: UINavigationController?
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
          //        self.mainCoordinator?.start()
          let storyboard = UIStoryboard(name: "Pincrux", bundle: nil)
          if let container = storyboard.instantiateViewController(withIdentifier: "PincruxViewController") as? PincruxViewController {
              self.navigationController?.pushViewController(container, animated: false)
          }
      })
    
    GeneratedPluginRegistrant.register(with: self)
      
    navigationController = UINavigationController(rootViewController: flutterViewController)
    navigationController?.isNavigationBarHidden = true
    window?.rootViewController = navigationController
//    mainCoordinator = AppCoordinator(navigationController: navigationController)
    window?.makeKeyAndVisible()
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
