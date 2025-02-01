import 'package:flutter/material.dart';
import 'login.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents bottom overflow
      backgroundColor: const Color.fromARGB(255, 22, 89, 83),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Curved Background
                      Positioned(
                        top: constraints.maxHeight * 0.2,
                        child: Container(
                          width: 400,
                          height: 750,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 223, 223, 223),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),

                      Column(
                        children: [
                          SizedBox(height: constraints.maxHeight * 0.15),
                          Expanded(
                            child: SingleChildScrollView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                  const Text(
                                    'SIGNUP',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Righteous',
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 22, 89, 83),
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  _buildTextField(Icons.email, "Email"),
                                  _buildTextField(Icons.person, "Username"),
                                  _buildTextField(Icons.lock, "Password",
                                      obscureText: true),
                                  _buildTextField(
                                      Icons.lock_outline, "Confirm Password",
                                      obscureText: true),
                                  _buildTextField(Icons.phone, "Phone number"),

                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 22, 89, 83),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.all(14.0),
                                      child: Text('SignUp'),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: 20), // Space at the bottom
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Helper method for text fields
  Widget _buildTextField(IconData icon, String hintText,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
