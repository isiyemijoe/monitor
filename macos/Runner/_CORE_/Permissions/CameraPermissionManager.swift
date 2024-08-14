//
//  PermissionManager.swift
//  Runner
//
//  Created by Joseph Isiyemi on 07/08/2024.
//

import AVFoundation
import Foundation

class CameraPermissionManager {
    static let shared: CameraPermissionManager = CameraPermissionManager()

    private init() {}

    func getCameraPermissionStatus() -> String {
        let status = AVCaptureDevice.authorizationStatus(for: .video)

        switch status {
        case .authorized:
            return "AUTHORISED"
        case .restricted:
            return "RESTRICTED"
        case .notDetermined:
            return "NOT_DETERMINED"
        case .denied:
            return "DENIED"
        default:
            return ""
        }
    }

    func requestCameraPermission() -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            return true
        case .restricted:
            return true
        case .notDetermined:
            return _requestCameraPermission()
        case .denied:
            return false
        default:
            return false
        }
    }

    private func _requestCameraPermission() -> Bool {
        var permissionStatus = false
        AVCaptureDevice.requestAccess(for: .video) { success in
            permissionStatus = success
        }
        return permissionStatus
    }
}

