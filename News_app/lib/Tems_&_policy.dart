import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms and Policy",
          style: GoogleFonts.aclonica(),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("1.INTRODUCTION:",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("-Brief overview of the app and its purpose."
                    "-Statement of agreement to the terms and conditions."),SizedBox(height: 10,),
        Text("2.PRIVACY AND DATA HANDLING:",style: TextStyle(fontWeight: FontWeight.bold),),
        Text("-Data collection practices."
              "-Use of cookies and tracking technologies."
              "-Data storage and security measures."
              "-Compliance with relevant data protection laws (e.g., GDPR, CCPA)."),SizedBox(height: 10,),
        Text("PRIVACY POLICY:",style: TextStyle(fontWeight: FontWeight.bold),),
      Text("Introduction:",style: TextStyle(fontWeight: FontWeight.bold),),
        Text("Purpose and scope of the policy."
          "Agreement to the privacy practices"),SizedBox(height: 10,),
            Text("Types of information collected (personal, non-personal."
               "Methods of collection (cookies, user input, etc."
            "Purpose of collecting each type of information.")



          ],
        ),
      ),
    );
  }
}
