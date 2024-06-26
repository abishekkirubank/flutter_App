import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class page extends StatefulWidget {
  const page({super.key});

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  bool _notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.aclonica(),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Notifications',
              style: GoogleFonts.aclonica(),
            ),
            SwitchListTile(
              title: Text('Enable Notifications',style:GoogleFonts.aclonica() ,),
              value: _notificationsEnabled,
              onChanged: (newValue) {
                setState(() {
                  _notificationsEnabled = newValue;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Perform save settings action
                print('Settings saved!');
              },
              child: Text('Save Settings',style: GoogleFonts.aclonica(),),
            ),
          ],
        ),
      ),
    );
  }
}
