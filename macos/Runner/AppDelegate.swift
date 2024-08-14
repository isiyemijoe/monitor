import AVFoundation
import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
    let channelName: String = "com.joseph.monitoring"

    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    override func applicationDidFinishLaunching(_ notification: Notification) {
        let controller: FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: channelName, binaryMessenger: controller.engine.binaryMessenger)
        channel.setMethodCallHandler({ (_ call: FlutterMethodCall, _ result: @escaping FlutterResult) in
            self._handle(call, result)
        })
    }

    func _handle(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        if "getCameraPermissionStatus" == call.method {
            result(CameraPermissionManager.shared.getCameraPermissionStatus())
        } else if "requestCameraPermission" == call.method {
            result(CameraPermissionManager.shared.requestCameraPermission())
        } else if "takeScreenShot" == call.method {

            let image = ScreenshotManager.TakeScreensShots(folderName: call.arguments as! String)
            print("Got result")

            result(image)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
