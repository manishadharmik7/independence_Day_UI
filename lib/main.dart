import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: IndependenceDayScreen(),
  ));
}

class IndependenceDayScreen extends StatefulWidget {
  @override
  _IndependenceDayScreenState createState() => _IndependenceDayScreenState();
}

class _IndependenceDayScreenState extends State<IndependenceDayScreen>
    with TickerProviderStateMixin {
  late AnimationController _textController;
  late Animation<Offset> _textSlideAnimation;
  late AnimationController _chakraController;
  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    // Text Slide Animation
    _textController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _textSlideAnimation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOut,
    ));
    _textController.forward();

    // Chakra Rotation Animation
    _chakraController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();

    // Button Bounce Animation
    _buttonController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _buttonAnimation = CurvedAnimation(
      parent: _buttonController,
      curve: Curves.elasticOut,
    );
    _buttonController.forward();
  }

  @override
  void dispose() {
    _textController.dispose();
    _chakraController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF9933), // Saffron
              Colors.white,      // White
              Color(0xFF138808), // Green
            ],
            stops: [0.33, 0.33, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            SlideTransition(
              position: _textSlideAnimation,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Text(
                      "Happy Independence Day",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000080), // Ashoka Chakra color
                      ),
                    ),
                    Text(
                      "15th August 2024",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),          
            RotationTransition(
              turns: _chakraController,
              child: Image.asset(
                'assets/ashok_chak.png', // Add your Ashoka Chakra image asset
                height: 150,
              ),
            ),        
            Image.asset(
              'assets/flag_anim.gif', // Add your waving flag gif asset
              height: 270,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
             SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Freedom in our minds, faith in our hearts,\n and memories in our souls.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  // ScaleTransition(
                  //   scale: _buttonAnimation,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // Handle button press
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Color(0xFFFF9933),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 24.0, vertical: 12.0),
                  //       child: Text(
                  //         "Learn More",
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  Text(
                    "@codecraftmanisha",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 5),
                  // 
                ],
              ),
            ),   
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
