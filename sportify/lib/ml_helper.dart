import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:sportify/opencv_helper.dart';

class MLHelper {
  static Interpreter? _interpreter;
  static bool _isLoaded = false;

  // Sports equipment classes (update these based on your model's output)
  static const List<String> classes = [
    'Basketball',
    'Volleyball',
    'Badminton',
    'Soccer',
    'Tennis',
    'Table Tennis',
    'Chess',
    'Cycling',
  ];

  // Model input/output details
  static const int inputSize = 224; // Common size for mobile models, adjust if different
  static const int numChannels = 3; // RGB
  static const int numClasses = 8; // Number of sports equipment classes

  /// Load the TensorFlow Lite model
  static Future<bool> loadModel() async {
    if (_isLoaded && _interpreter != null) {
      return true;
    }

    try {
      // Load model from assets
      final ByteData data = await rootBundle.load('assets/tf_lite_model.tflite');
      final Uint8List bytes = data.buffer.asUint8List();

      // Create interpreter
      _interpreter = Interpreter.fromBuffer(bytes);
      _isLoaded = true;

      print('Model loaded successfully');
      return true;
    } catch (e) {
      print('Error loading model: $e');
      return false;
    }
  }

  /// Preprocess image for model input
  static Float32List preprocessImage(img.Image image) {
    // Resize image to model input size
    img.Image resized = img.copyResize(
      image,
      width: inputSize,
      height: inputSize,
    );

    // Convert to float32 array and normalize to [0, 1]
    Float32List inputBuffer = Float32List(inputSize * inputSize * numChannels);
    int pixelIndex = 0;

    for (int y = 0; y < inputSize; y++) {
      for (int x = 0; x < inputSize; x++) {
        final pixel = resized.getPixel(x, y);
        // Normalize pixel values to [0, 1]
        inputBuffer[pixelIndex++] = (pixel.r / 255.0);
        inputBuffer[pixelIndex++] = (pixel.g / 255.0);
        inputBuffer[pixelIndex++] = (pixel.b / 255.0);
      }
    }

    return inputBuffer;
  }

  /// Run inference on an image file
  static Future<Map<String, dynamic>?> predictImage(String imagePath) async {
    if (!_isLoaded || _interpreter == null) {
      bool loaded = await loadModel();
      if (!loaded) {
        return null;
      }
    }

    try {
      // Read and decode image
      final File imageFile = File(imagePath);
      if (!await imageFile.exists()) {
        print('Image file does not exist: $imagePath');
        return null;
      }

      // Use OpenCV preprocessing to enhance image quality
      final Uint8List? processedBytes = await OpenCVHelper.preprocessImage(imagePath);
      
      if (processedBytes == null) {
        print('Failed to preprocess image with OpenCV, using original');
        // Fallback to original image
        final Uint8List imageBytes = await imageFile.readAsBytes();
        final img.Image? image = img.decodeImage(imageBytes);
        if (image == null) {
          print('Failed to decode image');
          return null;
        }
        final Float32List inputBuffer = preprocessImage(image);
        return await _runInference(inputBuffer);
      }

      // Decode the preprocessed image
      final img.Image? processedImage = img.decodeImage(processedBytes);
      if (processedImage == null) {
        print('Failed to decode preprocessed image');
        return null;
      }

      // Resize and prepare for model input
      final Float32List inputBuffer = preprocessImage(processedImage);
      return await _runInference(inputBuffer);
    } catch (e) {
      print('Error during prediction: $e');
      return null;
    }
  }

  /// Run inference with preprocessed input buffer
  static Future<Map<String, dynamic>?> _runInference(Float32List inputBuffer) async {
    try {
      // Prepare input/output tensors
      final input = [inputBuffer];
      final output = [Float32List(numClasses)];

      // Run inference
      _interpreter!.run(input, output);

      // Get predictions
      final predictions = output[0];
      
      // Find the class with highest probability
      double maxScore = predictions[0];
      int maxIndex = 0;
      for (int i = 1; i < predictions.length; i++) {
        if (predictions[i] > maxScore) {
          maxScore = predictions[i];
          maxIndex = i;
        }
      }

      // Convert to percentage
      double confidence = maxScore * 100;

      // Get all predictions with confidence scores
      List<Map<String, dynamic>> allPredictions = [];
      for (int i = 0; i < predictions.length; i++) {
        allPredictions.add({
          'class': classes[i],
          'confidence': predictions[i] * 100,
        });
      }

      // Sort by confidence
      allPredictions.sort((a, b) => b['confidence'].compareTo(a['confidence']));

      return {
        'predictedClass': classes[maxIndex],
        'confidence': confidence,
        'allPredictions': allPredictions,
      };
    } catch (e) {
      print('Error during inference: $e');
      return null;
    }
  }

  /// Dispose the interpreter
  static void dispose() {
    _interpreter?.close();
    _interpreter = null;
    _isLoaded = false;
  }
}

