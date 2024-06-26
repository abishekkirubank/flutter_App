import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
       body: Column(
           children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(0,20,0,0),
               child: Text("Contact",style: TextStyle(fontWeight: FontWeight.bold),),
             ),
             Center(child: Text("EmailId : abishekkiruban2002@gmail.com"))
           ],
       ),
    );
  }
}
