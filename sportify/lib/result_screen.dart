import 'package:flutter/material.dart';
import 'dart:io';

class ResultScreen extends StatelessWidget {
  final String imagePath;
  final String predictedClass;
  final double confidence;
  final List<Map<String, dynamic>> allPredictions;

  const ResultScreen({
    required this.imagePath,
    required this.predictedClass,
    required this.confidence,
    required this.allPredictions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classification Result'),
        backgroundColor: Color.fromRGBO(41, 115, 178, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Captured Image
            Container(
              width: double.infinity,
              height: 300,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Prediction Result
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(41, 115, 178, 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    'Predicted Equipment',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(41, 115, 178, 1),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    predictedClass,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${confidence.toStringAsFixed(1)}% confidence',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Confidence Bar
                  LinearProgressIndicator(
                    value: confidence / 100,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(41, 115, 178, 1),
                    ),
                    minHeight: 8,
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // All Predictions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'All Predictions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12),
            ...allPredictions.map((prediction) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: prediction['class'] == predictedClass
                      ? Color.fromRGBO(41, 115, 178, 0.2)
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: prediction['class'] == predictedClass
                      ? Border.all(
                          color: Color.fromRGBO(41, 115, 178, 1),
                          width: 2,
                        )
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      prediction['class'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: prediction['class'] == predictedClass
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    Text(
                      '${prediction['confidence'].toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: prediction['class'] == predictedClass
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: Color.fromRGBO(41, 115, 178, 1),
                      ),
                    ),
                  ],
                ),
              );
            }),

            SizedBox(height: 24),

            // Action Buttons
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.camera_alt),
                      label: Text('Take Another'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(41, 115, 178, 1),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.popUntil(
                          context, (route) => route.isFirst),
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

