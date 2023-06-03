import 'dart:io';
//import 'package:trust_block/my_facial_recognition_library.dart';
import 'package:av_foundation/av_foundation.dart';
import 'package:vision/vision.dart';
import 'package:camera_avfoundation/camera_avfoundation.dart';
import 'dart:async';
import 'package:flutter/services.dart';
//import 'package:trust_block/ios/Runner/AppDelegate.swift';

const facialScanChannel = MethodChannel('facial_scan_channel');

Future<List<double>> getLandmarkPointsIOS() async {
  try {
    final List<double> landmarkPoints =
        await facialScanChannel.invokeMethod('getLandmarkPointsIOS');
    return landmarkPoints;
  } on PlatformException catch (e) {
    print('Error: ${e.message}');
    // Handle the error accordingly
    return [1.1];
  }
}

class FacialScanData {
  final String faceId;
  final List<double> landmarkPoints;
  final List<double> descriptorData;
  FacialScanData(this.faceId, this.landmarkPoints, this.descriptorData);
}

class FacialRecognitionHelper {
  static const platform = const MethodChannel('facial_recognition_channel');

  static Future<List<double>> getLandmarkPointsIOS() async {
    try {
      final List<dynamic> landmarkPoints =
          await platform.invokeMethod('getLandmarkPointsIOS');
      return landmarkPoints.cast<double>();
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
      throw FacialScanDataException(
          'Failed to retrieve landmark points on iOS');
    }
  }
}

// iOS implementation to capture and retrieve landmark points
Future<List<double>> getLandmarkPointsIOS() async {
  try {
    // Create an AVCaptureSession instance
    final session = AVCaptureSession();

    // Set the session preset to capture high-quality video frames
    session.sessionPreset = AVCaptureSessionPreset.hd1920x1080;

    // Get the default video device
    final videoDevices =
        await AVCaptureDevice.devicesWithMediaType(AVMediaType.video);
    final videoDevice = videoDevices.first as AVCaptureDevice;

    // Create an AVCaptureDeviceInput using the video device
    final deviceInput = AVCaptureDeviceInput.fromDevice(videoDevice);

    // Add the input to the session
    session.addInput(deviceInput);

    // Create an AVCaptureVideoDataOutput instance
    final videoOutput = AVCaptureVideoDataOutput();

    // Set the video output's videoSettings property to receive video frames in a pixel format suitable for processing
    final pixelFormatKey = kCVPixelBufferPixelFormatTypeKey;
    final pixelFormatValue = kCVPixelFormatType_32BGRA;
    videoOutput.videoSettings = {pixelFormatKey: pixelFormatValue};

    // Create a queue and set it as the delegate for the video output
    final videoDataOutputQueue = DispatchQueue(label: 'videoDataOutputQueue');
    videoOutput.setSampleBufferDelegateQueue(videoDataOutputQueue);

    // Add the output to the session
    session.addOutput(videoOutput);

    // Create a VNSequenceRequestHandler instance
    final requestHandler = VNSequenceRequestHandler();

    // Create a VNFaceLandmarksRequest instance
    final landmarksRequest = VNFaceLandmarksRequest((request, error) {
      if (error != null) {
        print('Error: ${error.localizedDescription}');
        return;
      }

      // Extract the landmark points from the request result
      final landmarksResult = request.results.first as VNFaceObservation;
      final landmarkPoints = landmarksResult.landmarks?.normalizedPoints;

      // Process the landmark points as needed
      if (landmarkPoints != null) {
        // Convert the landmark points to a list of doubles
        final landmarkPointsList =
            landmarkPoints.map((point) => point.x).toList();
        // Use the landmark points as required
        // ...
        // Return the landmark points
        return landmarkPointsList;
      }
    });

    // Start the session
    session.startRunning();

    // Capture a single video frame for landmark detection
    final videoConnection =
        videoOutput.connectionWithMediaType(AVMediaType.video);
    final sampleBuffer = await videoOutput
        .captureOutputSampleBufferFromConnection(videoConnection);

    // Perform landmark detection using Vision APIs
    await requestHandler.perform([landmarksRequest], on: sampleBuffer);

    // Stop the session
    session.stopRunning();

    throw Exception('Landmark points not found.');
  } catch (e) {
    // Handle any exceptions or errors that occur during the process
    print('Error: $e');
    throw FacialScanDataException('Failed to retrieve landmark points on iOS');
  }
}
