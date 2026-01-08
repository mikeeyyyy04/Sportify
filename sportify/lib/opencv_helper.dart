import 'dart:io';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:image/image.dart' as img;

/// OpenCV-like image preprocessing helper using the image package
/// Provides image enhancement, noise reduction, and preprocessing for ML models
class OpenCVHelper {
  /// Preprocess image for better classification
  /// Applies: noise reduction, contrast enhancement, and normalization
  static Future<Uint8List?> preprocessImage(String imagePath) async {
    try {
      // Read image file
      final File imageFile = File(imagePath);
      if (!await imageFile.exists()) {
        print('Image file does not exist: $imagePath');
        return null;
      }

      final Uint8List imageBytes = await imageFile.readAsBytes();
      
      // Decode image
      img.Image? image = img.decodeImage(imageBytes);
      if (image == null) {
        print('Failed to decode image');
        return null;
      }

      // Apply Gaussian blur to reduce noise (OpenCV-like)
      image = img.gaussianBlur(image, radius: 1);

      // Enhance contrast using histogram equalization
      image = _enhanceContrast(image);

      // Normalize brightness
      image = _normalizeBrightness(image);

      // Convert back to bytes
      return Uint8List.fromList(img.encodePng(image));
    } catch (e) {
      print('Image preprocessing error: $e');
      // If preprocessing fails, return original image
      try {
        final File imageFile = File(imagePath);
        return await imageFile.readAsBytes();
      } catch (e2) {
        print('Error reading original image: $e2');
        return null;
      }
    }
  }

  /// Enhance image contrast using histogram equalization
  static img.Image _enhanceContrast(img.Image image) {
    // Create a copy to work with
    img.Image enhanced = img.Image.from(image);

    // Calculate histogram for each channel
    for (int c = 0; c < 3; c++) { // RGB channels only
      List<int> histogram = List.filled(256, 0);
      
      // Build histogram
      for (int y = 0; y < image.height; y++) {
        for (int x = 0; x < image.width; x++) {
          final pixel = image.getPixel(x, y);
          int value = 0;
          if (c == 0) {
            value = pixel.r.toInt();
          } else if (c == 1) {
            value = pixel.g.toInt();
          } else {
            value = pixel.b.toInt();
          }
          histogram[value]++;
        }
      }

      // Calculate cumulative distribution
      List<int> cdf = List.filled(256, 0);
      cdf[0] = histogram[0];
      for (int i = 1; i < 256; i++) {
        cdf[i] = cdf[i - 1] + histogram[i];
      }

      // Normalize CDF
      int minCdf = cdf.firstWhere((value) => value > 0);
      int totalPixels = image.width * image.height;

      // Apply histogram equalization
      for (int y = 0; y < image.height; y++) {
        for (int x = 0; x < image.width; x++) {
          final pixel = image.getPixel(x, y);
          int r = pixel.r.toInt();
          int g = pixel.g.toInt();
          int b = pixel.b.toInt();

          if (c == 0) {
            r = ((cdf[r] - minCdf) * 255 / (totalPixels - minCdf)).round().clamp(0, 255);
          } else if (c == 1) {
            g = ((cdf[g] - minCdf) * 255 / (totalPixels - minCdf)).round().clamp(0, 255);
          } else {
            b = ((cdf[b] - minCdf) * 255 / (totalPixels - minCdf)).round().clamp(0, 255);
          }

          enhanced.setPixel(x, y, img.ColorRgb8(r, g, b));
        }
      }
    }

    return enhanced;
  }

  /// Normalize image brightness
  static img.Image _normalizeBrightness(img.Image image) {
    img.Image normalized = img.Image.from(image);

    // Calculate average brightness
    double totalBrightness = 0;
    int pixelCount = 0;

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        totalBrightness += (pixel.r.toDouble() + pixel.g.toDouble() + pixel.b.toDouble()) / 3.0;
        pixelCount++;
      }
    }

    double avgBrightness = totalBrightness / pixelCount;
    double targetBrightness = 128.0; // Target middle gray
    double factor = targetBrightness / avgBrightness;

    // Apply brightness normalization
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        int r = (pixel.r.toDouble() * factor).round().clamp(0, 255);
        int g = (pixel.g.toDouble() * factor).round().clamp(0, 255);
        int b = (pixel.b.toDouble() * factor).round().clamp(0, 255);
        normalized.setPixel(x, y, img.ColorRgb8(r, g, b));
      }
    }

    return normalized;
  }

  /// Apply sharpening filter (OpenCV-like)
  static img.Image sharpen(img.Image image) {
    // Sharpening kernel
    List<List<double>> kernel = [
      [0, -1, 0],
      [-1, 5, -1],
      [0, -1, 0],
    ];

    return _applyConvolution(image, kernel);
  }

  /// Apply convolution filter (for various effects)
  static img.Image _applyConvolution(img.Image image, List<List<double>> kernel) {
    img.Image result = img.Image.from(image);
    int kernelSize = kernel.length;
    int offset = kernelSize ~/ 2;

    for (int y = offset; y < image.height - offset; y++) {
      for (int x = offset; x < image.width - offset; x++) {
        double r = 0, g = 0, b = 0;

        for (int ky = 0; ky < kernelSize; ky++) {
          for (int kx = 0; kx < kernelSize; kx++) {
            final pixel = image.getPixel(x + kx - offset, y + ky - offset);
            double weight = kernel[ky][kx];
            r += pixel.r.toDouble() * weight;
            g += pixel.g.toDouble() * weight;
            b += pixel.b.toDouble() * weight;
          }
        }

        result.setPixel(
          x,
          y,
          img.ColorRgb8(
            r.round().clamp(0, 255),
            g.round().clamp(0, 255),
            b.round().clamp(0, 255),
          ),
        );
      }
    }

    return result;
  }

  /// Resize image to specific dimensions with high quality
  static img.Image? resizeImage(img.Image image, int width, int height) {
    try {
      return img.copyResize(
        image,
        width: width,
        height: height,
        interpolation: img.Interpolation.cubic,
      );
    } catch (e) {
      print('Resize error: $e');
      return null;
    }
  }

  /// Convert image to grayscale (for edge detection, etc.)
  static img.Image toGrayscale(img.Image image) {
    return img.grayscale(image);
  }

  /// Detect edges using Sobel operator (OpenCV-like)
  static img.Image detectEdges(img.Image image) {
    // Convert to grayscale first
    img.Image gray = toGrayscale(image);

    // Sobel kernels
    List<List<double>> sobelX = [
      [-1, 0, 1],
      [-2, 0, 2],
      [-1, 0, 1],
    ];

    List<List<double>> sobelY = [
      [-1, -2, -1],
      [0, 0, 0],
      [1, 2, 1],
    ];

    img.Image edges = img.Image.from(gray);

    for (int y = 1; y < gray.height - 1; y++) {
      for (int x = 1; x < gray.width - 1; x++) {
        double gx = 0, gy = 0;

        for (int ky = 0; ky < 3; ky++) {
          for (int kx = 0; kx < 3; kx++) {
            final pixel = gray.getPixel(x + kx - 1, y + ky - 1);
            int value = pixel.r.toInt(); // Grayscale, so r=g=b
            gx += value * sobelX[ky][kx];
            gy += value * sobelY[ky][kx];
          }
        }

        int magnitude = math.sqrt(gx * gx + gy * gy).round().clamp(0, 255);
        edges.setPixel(x, y, img.ColorRgb8(magnitude, magnitude, magnitude));
      }
    }

    return edges;
  }

  /// Apply adaptive threshold (useful for object detection)
  static img.Image adaptiveThreshold(img.Image image, int blockSize, double c) {
    img.Image gray = toGrayscale(image);
    img.Image result = img.Image.from(gray);

    int halfBlock = blockSize ~/ 2;

    for (int y = 0; y < gray.height; y++) {
      for (int x = 0; x < gray.width; x++) {
        // Calculate local mean
        double sum = 0;
        int count = 0;

        for (int dy = -halfBlock; dy <= halfBlock; dy++) {
          for (int dx = -halfBlock; dx <= halfBlock; dx++) {
            int nx = (x + dx).clamp(0, gray.width - 1);
            int ny = (y + dy).clamp(0, gray.height - 1);
            final pixel = gray.getPixel(nx, ny);
            sum += pixel.r.toDouble();
            count++;
          }
        }

        double mean = sum / count;
        final pixel = gray.getPixel(x, y);
        int value = pixel.r.toDouble() > (mean - c) ? 255 : 0;
        result.setPixel(x, y, img.ColorRgb8(value, value, value));
      }
    }

    return result;
  }
}
