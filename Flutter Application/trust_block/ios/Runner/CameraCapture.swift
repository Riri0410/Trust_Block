import AVFoundation
import Vision

public class CameraCapture {
    private var session: AVCaptureSession?
    
    public func captureLandmarkPoints(completion: @escaping ([CGPoint]?, Error?) -> Void) {
        let captureSession = AVCaptureSession()
        
        // Set the session preset to capture high-quality video frames
        if captureSession.canSetSessionPreset(.hd1920x1080) {
            captureSession.sessionPreset = .hd1920x1080
        }
        
        // Get the default video device
        guard let videoDevice = AVCaptureDevice.default(for: .video) else {
            completion(nil, FacialScanDataError.deviceNotFound)
            return
        }
        
        // Create an AVCaptureDeviceInput using the video device
        do {
            let input = try AVCaptureDeviceInput(device: videoDevice)
            captureSession.addInput(input)
        } catch {
            completion(nil, error)
            return
        }
        
        // Create an AVCaptureVideoDataOutput instance
        let videoOutput = AVCaptureVideoDataOutput()
        
        // Set the video output's videoSettings property to receive video frames in a pixel format suitable for processing
        let videoSettings: [String: Any] = [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA
        ]
        videoOutput.videoSettings = videoSettings
        
        // Create a queue and set it as the delegate for the video output
        let videoDataOutputQueue = DispatchQueue(label: "videoDataOutputQueue")
        videoOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
        
        // Add the output to the session
        captureSession.addOutput(videoOutput)
        
        // Create a VNSequenceRequestHandler instance
        let requestHandler = VNSequenceRequestHandler()
        
        // Create a VNFaceLandmarksRequest instance
        let landmarksRequest = VNFaceLandmarksRequest { request, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            // Extract the landmark points from the request result
            guard let result = request.results?.first as? VNFaceObservation else {
                completion(nil, FacialScanDataError.landmarkPointsNotFound)
                return
            }
            
            let landmarkPoints = result.landmarks?.normalizedPoints
            
            // Convert the landmark points to CGPoint array
            let cgLandmarkPoints = landmarkPoints?.map { CGPoint(x: $0.x, y: $0.y) }
            
            completion(cgLandmarkPoints, nil)
        }
        
        // Start the session
        captureSession.startRunning()
        
        // Capture a single video frame for landmark detection
        guard let videoConnection = videoOutput.connection(with: .video),
              let sampleBuffer = videoOutput.copyNextSampleBuffer() else {
            completion(nil, FacialScanDataError.captureFailed)
            return
        }
        
        // Perform landmark detection using Vision APIs
        try? requestHandler.perform([landmarksRequest], on: sampleBuffer)
        
        // Stop the session
        captureSession.stopRunning()
    }
}

extension CameraCapture: AVCaptureVideoDataOutputSampleBufferDelegate {
    public func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // This delegate method is required but no implementation is needed here
    }
}

enum FacialScanDataError: Error {
    case deviceNotFound
    case captureFailed
    case landmarkPointsNotFound
}