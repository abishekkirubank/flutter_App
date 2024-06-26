import 'package:flutter/material.dart';
import 'package:green/home.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late List<TextEditingController> controllers;
  late FocusNode currentFocusNode;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (index) => TextEditingController());
    currentFocusNode = FocusNode();

    // Automatically show OTP bottom sheet after a delay
    Future.delayed(Duration.zero, () {
      _showOTPBottomSheet(context);
    });
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    currentFocusNode.dispose();
    super.dispose();
  }

  void _showOTPBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'OTP Verification',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter the OTP sent to +91 xxxxxxxxxx',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        6,
                            (index) => SizedBox(
                          width: 40,
                          height: 40,
                          child: TextField(
                            controller: controllers[index],
                            focusNode: currentFocusNode,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 5) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            decoration: InputDecoration(
                              counter: Offstage(),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text('2:00 minutes'),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Implement OTP verification logic here

                        // Example navigation to Home screen after successful verification
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()), // Replace with actual Home screen
                        );
                      },
                      child: Text('Verify Code'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset('images/otp.png'), // Adjust the image path accordingly
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OtpPage(),
  ));
}