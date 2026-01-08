# Model Integration Setup Guide

## Step 1: Convert .h5 Model to .tflite

Your trained model is in `.h5` format (Keras), but Flutter mobile apps need `.tflite` format. Follow these steps:

### Prerequisites
- Python 3.7+
- TensorFlow installed

### Conversion Steps

1. **Install TensorFlow** (if not already installed):
   ```bash
   pip install tensorflow
   ```

2. **Run the conversion script**:
   ```bash
   python convert_model.py
   ```

   This will:
   - Load your `sportify/sportify.h5` model
   - Convert it to TensorFlow Lite format
   - Save it as `sportify/assets/model.tflite`

3. **Verify the model was created**:
   - Check that `sportify/assets/model.tflite` exists
   - The file should be significantly smaller than the .h5 file

## Step 2: Update Model Configuration (if needed)

If your model has different specifications, update `sportify/lib/ml_helper.dart`:

- **Input size**: Change `inputSize` (default: 224x224)
- **Number of classes**: Update `numClasses` (default: 8)
- **Class names**: Update the `classes` list to match your model's output classes

Current classes:
```dart
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
```

## Step 3: Install Dependencies

Run in your Flutter project:
```bash
cd sportify
flutter pub get
```

## Step 4: Test the App

1. **Build and run the app**:
   ```bash
   flutter run
   ```

2. **Test the camera classification**:
   - Open the app
   - Tap the "Diagnose" button in the bottom navigation
   - Point camera at a sports equipment
   - Tap the camera button to capture
   - Wait for classification results

## Troubleshooting

### Model not loading
- Ensure `assets/model.tflite` exists in the correct location
- Check that the model path in `pubspec.yaml` is correct
- Verify the model file size (should be reasonable, not 0 bytes)

### Wrong predictions
- Verify the class names in `ml_helper.dart` match your model's training classes
- Check that the input size matches your model's expected input
- Ensure image preprocessing matches your training preprocessing

### Performance issues
- The model is optimized for mobile, but large models may still be slow
- Consider using a smaller model or quantizing further
- First inference may be slower due to model loading

## Model Specifications

Make sure your model:
- Accepts RGB images (3 channels)
- Outputs probabilities for each class
- Has been trained on similar image sizes (224x224 recommended)

## Notes

- The model is loaded once when the app starts
- Images are automatically resized to match model input size
- Predictions show confidence scores for all classes
- The highest confidence prediction is displayed as the main result

