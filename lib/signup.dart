import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      // If validation passes, process signup
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Successful!")),
      );
    }
  }

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
                            color: Colors.white,
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
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: IconButton(
                                        icon: const Icon(Icons.arrow_back,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
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

                                    // Email Field
                                    _buildTextField(Icons.email, "Email",
                                        controller: _emailController,
                                        validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Email is required";
                                      }
                                      // You can add a simple email validation regex here
                                      return null;
                                    }),

                                    // Username Field
                                    _buildTextField(Icons.person, "Username",
                                        controller: _usernameController,
                                        validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Username is required";
                                      }
                                      if (value.length < 3) {
                                        return "Username must be at least 3 characters";
                                      }
                                      return null;
                                    }),

                                    // Password Field
                                    _buildTextField(Icons.lock, "Password",
                                        controller: _passwordController,
                                        obscureText: true, validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Password is required";
                                      }
                                      if (value.length < 6) {
                                        return "Password must be at least 6 characters";
                                      }
                                      return null;
                                    }),

                                    // Confirm Password Field
                                    _buildTextField(
                                        Icons.lock_outline, "Confirm Password",
                                        controller: _confirmPasswordController,
                                        obscureText: true, validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Confirm Password is required";
                                      }
                                      if (value != _passwordController.text) {
                                        return "Passwords do not match";
                                      }
                                      return null;
                                    }),

                                    // Phone Field
                                    _buildTextField(Icons.phone, "Phone number",
                                        controller: _phoneController,
                                        validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Phone number is required";
                                      }
                                      if (value.length <= 9) {
                                        return "Ph No. must be at least 10 characters";
                                      }
                                      return null;
                                    }),

                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 22, 89, 83),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      onPressed: _validateAndSubmit,
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

  // Helper method for text fields with validation
  Widget _buildTextField(IconData icon, String hintText,
      {bool obscureText = false,
      required TextEditingController controller,
      required String? Function(String?) validator}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 223, 223, 223), // Fill color

          // Set the border color same as the fill color
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 223, 223, 223), // Same as fill color
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 223, 223, 223), // Same as fill color
              width: 2,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
