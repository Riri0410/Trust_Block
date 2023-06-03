import 'dart:io';
import 'package:trust_block/my_facial_recognition_library.dart';

class FacialScanData {
  final String faceId;
  final List<double> landmarkPoints;
  final List<double> descriptorData;

  FacialScanData(this.faceId, this.landmarkPoints, this.descriptorData);
}

/*
// Android implementation
Future<FacialScanData> recoverAndroidFacialScanData() async {
  // Use Android APIs to capture facial scan data and retrieve the required information
  final androidFacialScanData = await MyFacialRecognitionLibrary.getFacialScanDataAndroid();

  // Extract the relevant information from the Android facial scan data
  final faceId = androidFacialScanData.faceId;
  final landmarkPoints = androidFacialScanData.landmarkPoints;
  final descriptorData = androidFacialScanData.descriptorData;

  // Create an instance of FacialScanData and fill the fields with the retrieved information
  final facialScanData = FacialScanData(faceId, landmarkPoints, descriptorData);

  return facialScanData;
}
*/
// iOS implementation
Future<FacialScanData> recoverIOSFacialScanData() async {
  // Use iOS APIs to capture facial scan data and retrieve the required information
  final iOSFacialScanData =
      await MyFacialRecognitionLibrary.getFacialScanDataIOS();

  // Extract the relevant information from the iOS facial scan data
  final faceId = iOSFacialScanData.faceId;
  final landmarkPoints = iOSFacialScanData.landmarkPoints;
  final descriptorData = iOSFacialScanData.descriptorData;

  // Create an instance of FacialScanData and fill the fields with the retrieved information
  final facialScanData = FacialScanData(faceId, landmarkPoints, descriptorData);

  return facialScanData;
}
