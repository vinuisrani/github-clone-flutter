import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Authentication/auth.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = Colors.white; // Initial background color

  @override
  void initState() {
    super.initState();
    // Start the background color changing loop
    startBackgroundColorLoop();
  }

  void startBackgroundColorLoop() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      // Change the background color every 2 seconds
      setState(() {
        _backgroundColor = _backgroundColor == Colors.white ? Colors.black : Colors.white;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1), // Duration for smooth transition
        color: _backgroundColor, // Set background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // GIF at center
              Image.asset(
                'assets/black-cat.gif', // Replace with your GIF path
                width: 300, // Adjust width as needed
                height: 300, // Adjust height as needed
              ),
              SizedBox(height: 40),
              Text(
                'Welcome To Github',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _backgroundColor == Colors.white ? Colors.black : Colors.white, // Text color based on background color
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to another screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: _backgroundColor == Colors.white ? Colors.white : Colors.black, // Text color based on background color
                  backgroundColor: _backgroundColor == Colors.white ? Colors.black : Colors.white, // Button background color based on background color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // Button border radius
                    side: BorderSide(color: Colors.black), // Button border color
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
