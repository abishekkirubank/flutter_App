import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/About_page.dart';
import 'package:news_app/Contact.dart';
import 'package:news_app/Tems_&_policy.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help",
          style: GoogleFonts.aclonica(),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      body: Expanded(
          child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.contactless_outlined),
            title: Text('Contact Administator', style: GoogleFonts.aclonica()),
            onTap: () {
              // Navigate to home screen
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact()));
            },
          ),
          ListTile(
            leading: Icon(Icons.policy_outlined),
            title: Text('Terms and Policy', style: GoogleFonts.aclonica()),
            onTap: () {
              // Navigate to home screen
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Terms()));
            },
          )
        ],
      )),
    );
  }
}
