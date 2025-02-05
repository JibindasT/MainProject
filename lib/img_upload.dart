import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File? _image;
  final TextEditingController _annotationController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // Bottom navigation index
  int _selectedIndex = 0; // Assuming this screen is at index 0

  // Function to pick an image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to clear image and annotation
  void _refresh() {
    setState(() {
      _image = null;
      _annotationController.clear();
    });
  }

  // Function to save (dummy save action)
  void _save() {
    if (_image == null || _annotationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please select an image and enter an annotation')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Image and annotation saved successfully!')),
    );
  }

  // Function to handle bottom navigation item selection
  void _onItevoid;
  _onItemTapped(int index) {
    if (_selectedIndex == index) return; // Prevent unnecessary rebuilds

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/activities');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/menu');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker & Annotation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image display area
            _image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(_image!,
                        height: 200, width: double.infinity, fit: BoxFit.cover),
                  )
                : Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(child: Text('No Image Selected')),
                  ),
            const SizedBox(height: 20),

            // Annotation text field

            SizedBox(
              height: 150,
              child: SingleChildScrollView(
                child: TextField(
                  controller: _annotationController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Enter annotation',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Buttons: Pick Image (Gallery/Camera), Save, Refresh
            Column(
              children: [
                // Gallery and Camera Buttons
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the buttons
                  children: [
                    // Set a fixed width for the Gallery button
                    SizedBox(
                      width: 150, // Set the desired width here
                      child: ElevatedButton.icon(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        icon: const Icon(Icons.image),
                        label: const Text('Gallery'),
                      ),
                    ),
                    // Add space between the buttons
                    const SizedBox(width: 10), // Adjust the space as needed
                    // Set a fixed width for the Camera button
                    SizedBox(
                      width: 150, // Set the same width here for equal length
                      child: ElevatedButton.icon(
                        onPressed: () => _pickImage(ImageSource.camera),
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Camera'),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Save and Refresh Buttons
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the buttons
                  children: [
                    // Set a fixed width for the Save button
                    SizedBox(
                      width: 150, // Set the same width here for equal length
                      child: ElevatedButton(
                        onPressed: _refresh,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text('Refresh',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    // Add space between the buttons
                    const SizedBox(width: 10), // Adjust the space as needed
                    // Set a fixed width for the Refresh button
                    SizedBox(
                      width: 150, // Set the desired width here
                      child: ElevatedButton(
                        onPressed: _save,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text(
                          '  Save  ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: Container(
        color: Colors.black,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.insights_outlined), label: 'My Activities'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded), label: 'Menu'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
