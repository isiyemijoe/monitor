//
//  ScreenshotManager.swift
//  Runner
//
//  Created by Joseph Isiyemi on 07/08/2024.
//

import FlutterMacOS
import Foundation
import SwiftUI

class ScreenshotManager {
    static func TakeScreensShots(folderName: String) -> FlutterStandardTypedData? {
        print("TakeScreensShots")
        var displayCount: UInt32 = 0
        var result = CGGetActiveDisplayList(0, nil, &displayCount)
        if result != CGError.success {
            print("error: \(result)")
            return nil
        }
        let allocated = Int(displayCount)
        let activeDisplays = UnsafeMutablePointer<CGDirectDisplayID>.allocate(capacity: allocated)
        result = CGGetActiveDisplayList(displayCount, activeDisplays, &displayCount)

        if result != CGError.success {
            print("error: \(result)")
            return nil
        }

        for i in 1 ... displayCount {
            let unixTimestamp = CreateTimeStamp()
            let fileUrl = URL(fileURLWithPath: folderName + "\(unixTimestamp)" + "_" + "\(i)" + ".jpg", isDirectory: true)
            let screenShot: CGImage = CGDisplayCreateImage(activeDisplays[Int(i - 1)])!
            let bitmapRep = NSBitmapImageRep(cgImage: screenShot)
            let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])!

            do {

                try jpegData.write(to: fileUrl, options: .atomic)
                print("Generated jpeg")

                return FlutterStandardTypedData(bytes: jpegData)

            } catch { print("error: \(error)") }
        }
        return nil
    }

    static func CreateTimeStamp() -> Int32 {
        return Int32(Date().timeIntervalSince1970)
    }
}

/// Convert unit8List to byte
// let uintInt8List =  call.arguments as! FlutterStandardTypedData
//      let byte = [UInt8](uintInt8List.data)
