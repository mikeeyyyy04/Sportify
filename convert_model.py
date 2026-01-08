"""
Script to convert Keras .h5 model to TensorFlow Lite .tflite format
Run this script: python convert_model.py
"""

import tensorflow as tf
import os

# Path to your .h5 model
model_path = 'sportify/sportify.h5'
output_path = 'sportify/assets/model.tflite'

# Check if model exists
if not os.path.exists(model_path):
    print(f"Error: Model file not found at {model_path}")
    exit(1)

print(f"Loading model from {model_path}...")
try:
    # Load the Keras model
    model = tf.keras.models.load_model(model_path)
    print("Model loaded successfully!")
    
    # Convert to TensorFlow Lite
    print("Converting to TensorFlow Lite...")
    converter = tf.lite.TFLiteConverter.from_keras_model(model)
    
    # Optional: Optimize for mobile (reduces model size)
    converter.optimizations = [tf.lite.Optimize.DEFAULT]
    
    # Convert
    tflite_model = converter.convert()
    
    # Save the converted model
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, 'wb') as f:
        f.write(tflite_model)
    
    print(f"Model converted successfully!")
    print(f"Saved to: {output_path}")
    print(f"Model size: {len(tflite_model) / 1024 / 1024:.2f} MB")
    
except Exception as e:
    print(f"Error during conversion: {e}")
    print("\nMake sure you have tensorflow installed:")
    print("pip install tensorflow")

