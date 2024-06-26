import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/main.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Contact",
            style: GoogleFonts.aclonica(),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[300],
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "About Our Weather App",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  "Welcome to our Weather App! We are dedicated to providing you with accurate and up-to-date weather information to help you plan your day and stay informed about weather conditions wherever you are."),SizedBox(height: 20,),
              Text("Our Mission",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("Our mission is to empower individuals and communities with the knowledge they need to make informed decisions about their daily activities, travel plans, and outdoor adventures. We strive to deliver reliable weather forecasts with precision and clarity.")
            ],
          ),
        ));
  }
}
