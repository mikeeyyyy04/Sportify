import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportify/ml_helper.dart';
import 'package:sportify/result_screen.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  bool _isLoading = true;
  bool _isProcessing = false;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadModel();
  }

  Future<void> _loadModel() async {
    await MLHelper.loadModel();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        _controller = CameraController(
          _cameras![0],
          ResolutionPreset.medium, // Changed from high to medium for better compatibility
        );
        await _controller!.initialize();
        
        // Check if camera is actually initialized
        if (!_controller!.value.isInitialized) {
          throw Exception('Camera failed to initialize');
        }
        
        setState(() {
          _isInitialized = true;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No cameras available. Please check your device.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      print('Error initializing camera: $e');
      setState(() {
        _isLoading = false;
        _isInitialized = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Camera error: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 5),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    MLHelper.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!_isInitialized || _controller == null || _isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      // Take picture
      final XFile image = await _controller!.takePicture();
      await _classifyImage(image.path);
    } catch (e) {
      print('Error taking picture: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  Future<void> _pickImageFromGallery() async {
    if (_isProcessing) return;

    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image != null) {
        await _classifyImage(image.path);
      }
    } catch (e) {
      print('Error picking image: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error picking image: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _classifyImage(String imagePath) async {
    setState(() {
      _isProcessing = true;
    });

    // Show loading dialog
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Analyzing image...'),
              ],
            ),
          ),
        ),
      );
    }

    try {
      // Run inference
      final result = await MLHelper.predictImage(imagePath);

      // Close loading dialog
      if (mounted) {
        Navigator.pop(context);
      }

      if (result != null && mounted) {
        // Navigate to result screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              imagePath: imagePath,
              predictedClass: result['predictedClass'],
              confidence: result['confidence'],
              allPredictions: result['allPredictions'],
            ),
          ),
        );
      } else {
        // Show error message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to classify image. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      print('Error classifying image: $e');
      if (mounted) {
        Navigator.pop(context); // Close loading dialog if still open
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error classifying image: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        backgroundColor: Color.fromRGBO(41, 115, 178, 1),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _isInitialized && _controller != null && _controller!.value.isInitialized
              ? Stack(
                  children: [
                    // Camera preview
                    SizedBox.expand(
                      child: CameraPreview(_controller!),
                    ),
                    // Bottom action buttons
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Gallery button
                          FloatingActionButton(
                            onPressed: _isProcessing ? null : _pickImageFromGallery,
                            backgroundColor: _isProcessing ? Colors.grey : Color.fromRGBO(41, 115, 178, 1),
                            heroTag: "gallery",
                            child: Icon(Icons.photo_library, color: Colors.white),
                          ),
                          // Camera capture button
                          FloatingActionButton(
                            onPressed: _isProcessing ? null : _takePicture,
                            backgroundColor: _isProcessing ? Colors.grey : Colors.white,
                            heroTag: "camera",
                            child: _isProcessing
                                ? CircularProgressIndicator()
                                : Icon(Icons.camera_alt, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'Camera not available',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'You can still choose an image from gallery',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 24),
                      // Gallery button when camera is not available
                      FloatingActionButton.extended(
                        onPressed: _isProcessing ? null : _pickImageFromGallery,
                        backgroundColor: Color.fromRGBO(41, 115, 178, 1),
                        icon: Icon(Icons.photo_library, color: Colors.white),
                        label: Text(
                          'Choose from Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

