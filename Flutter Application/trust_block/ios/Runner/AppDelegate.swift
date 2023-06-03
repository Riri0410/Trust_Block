import Flutter
import UIKit
import AVFoundation
import Vision

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  // Create an instance of AVCaptureSession
  private var captureSession: AVCaptureSession?
  private var videoOutput: AVCaptureVideoDataOutput?
  
  // Constants for output dimensions
  private let outputWidth = 640
  private let outputHeight = 480
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Initialize the Flutter engine
    let flutterEngine = FlutterEngine(name: "MyFlutterEngine")
    flutterEngine.run()
    
    // Create a method channel
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let facialScanChannel = FlutterMethodChannel(name: "facial_scan_channel", binaryMessenger: controller.binaryMessenger)
    
    // Handle the method call from Flutter
    facialScanChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "getLandmarkPointsIOS" {
        self?.startFacialScan { (landmarkPoints) in
          // Return the landmark points to Flutter
          result(landmarkPoints)
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    
    // Override the default Flutter root view controller
    window.rootViewController = controller
    window.makeKeyAndVisible()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  // Start the facial scan and retrieve the landmark points
  private func startFacialScan(completion: @escaping ([Double]) -> Void) {
    captureSession = AVCaptureSession()
    captureSession?.sessionPreset = .high
    
    guard let videoDevice = AVCaptureDevice.default(for: .video),
          let videoInput = try? AVCaptureDeviceInput(device: videoDevice),
          captureSession?.canAddInput(videoInput) == true else {
      completion([])
      return
    }
    
    captureSession?.addInput(videoInput)
    
    let videoOutput = AVCaptureVideoDataOutput()
    videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "VideoDataOutputQueue"))
    
    guard captureSession?.canAddOutput(videoOutput) == true else {
      completion([])
      return
    }
    
    captureSession?.addOutput(videoOutput)
    self.videoOutput = videoOutput
    
    captureSession?.startRunning()
    
    // Perform facial landmark detection and retrieve points
    performFacialLandmarkDetection { (landmarkPoints) in
      completion(landmarkPoints)
    }
  }
  
  // Perform facial landmark detection on captured video frames
  private func performFacialLandmarkDetection(completion: @escaping ([Double]) -> Void) {
    let sequenceHandler = VNSequenceRequestHandler()
    
    guard let pixelBuffer = CMSampleBufferGetImageBuffer(videoOutput?.copyNextSampleBuffer()) else {
      completion([])
      return
    }
    
    // Create a face landmark request
    let request = VNDetectFaceLandmarksRequest { (request, error) in
      guard let observations = request.results as? [VNFaceObservation],
            let faceObservation = observations.first,
            let landmarks = faceObservation.landmarks else {
        completion([])
        return
      }
      
      // Retrieve the landmark points
      var landmarkPoints: [Double] = []
      
      if let normalizedPoints = landmarks.normalizedPoints(for: .all) {
        for point in normalizedPoints {
          landmarkPoints.append(Double(point.x))
          landmarkPoints.append(Double(point.y))
        }
      }
      
      completion(landmarkPoints)
    }
    
    // Perform the facial landmark request
    try? sequenceHandler.perform([request], on: pixelBuffer)
  }
}

extension AppDelegate: AVCaptureVideoDataOutputSampleBufferDelegate {
  // Capture video frames and pass them for facial landmark detection
  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    // Pass the video frame for facial landmark detection
    performFacialLandmarkDetection { (_) in
      // You can perform any additional processing on the landmark data if needed
    }
  }
}

