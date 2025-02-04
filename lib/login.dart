import 'package:flutter/material.dart';
import 'package:main_project/forgotpass.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      // If validation passes, process login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 89, 83),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight, // Prevent overflow
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Curved Rectangle Positioned Correctly
                  Positioned(
                    top: constraints.maxHeight * 0.3,
                    child: Container(
                      width: 400,
                      height: 650,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                  ),

                  // Login Form Inside a Column
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: constraints.maxHeight * 0.25),
                        SingleChildScrollView(
                          child: Form(
                            key: _formKey, // Assign form key
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'LOGIN',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Righteous',
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 22, 89, 83),
                                  ),
                                ),
                                SizedBox(height: 20),

                                // Username validation
                                TextFormField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    hintText: 'Enter your username',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 223, 223, 223),
                                    // Set border color to match the fill color
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 223, 223, 223),
                                          width:
                                              2), // Border color same as fill
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 223, 223, 223),
                                          width:
                                              2), // Border color same as fill
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Username is required";
                                    }
                                    if (value.length < 3) {
                                      return "username must be at least 3 characters";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16),

                                // Password Field
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: 'Enter your password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    filled: true,

                                    fillColor:
                                        Color.fromARGB(255, 223, 223, 223),
                                    // Set border color to match the fill color
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 223, 223, 223),
                                          width:
                                              2), // Border color same as fill
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width:
                                              2), // Border color same as fill
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password is required";
                                    }
                                    if (value.length < 6) {
                                      return "Password must be at least 6 characters";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 8),

                                // Forgot Password Link
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                forgotScreen()),
                                      );
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 22, 89, 83)),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),

                                // Login Button
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 22, 89, 83),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed:
                                      _validateAndSubmit, // Calls validation function
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Text('LOGIN'),
                                  ),
                                ),
                                SizedBox(height: 20),

                                // Sign Up Link
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()),
                                    );
                                  },
                                  child: Text(
                                    'Don’t have an account? SignUp',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 22, 89, 83)),
                                  ),
                                ),
                              ],
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
        },
      ),
    );
  }
}
