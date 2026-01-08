# Sportify

A Flutter mobile application that uses machine learning to identify sports equipment through camera or image upload.

## Features

- 🏀 Sports equipment identification using TensorFlow Lite
- 📸 Camera integration for real-time scanning
- 🖼️ Image gallery support
- 🎯 Support for 8 sports: Basketball, Volleyball, Badminton, Soccer, Tennis, Table Tennis, Chess, and Cycling
- 📱 Beautiful and intuitive UI

## Setup

### Prerequisites

- Flutter SDK (>=3.3.2)
- Android Studio / Xcode (for mobile development)
- Python 3.7+ (for model conversion)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/mikeeyyyy04/Sportify.git
cd Sportify/sportify
```

2. Install Flutter dependencies:
```bash
flutter pub get
```

3. **Important: Model Files**
   - The model files (`sportify.h5` and `tf_lite_model.tflite`) are not included in the repository due to size limitations
   - You need to generate them using the conversion script:
   ```bash
   python convert_model.py
   ```
   - See `MODEL_SETUP.md` for detailed instructions

4. Build the app:
```bash
flutter build apk --release
```

## Project Structure

- `lib/` - Main application code
  - `camera_screen.dart` - Camera and image picker functionality
  - `ml_helper.dart` - TensorFlow Lite model integration
  - `homescreen.dart` - Main navigation screen
  - `intropage.dart` - Introduction screen
  - `result_screen.dart` - Display classification results
- `assets/` - Images and model files
- `android/` - Android-specific configuration

## Building APK

To build a release APK:
```bash
cd sportify
flutter build apk --release
```

The APK will be generated at: `build/app/outputs/flutter-apk/app-release.apk`

## Documentation

- `MODEL_SETUP.md` - Instructions for setting up the ML model
- `OPENCV_INTEGRATION.md` - OpenCV integration details

## License

This project is private and not licensed for public use.
