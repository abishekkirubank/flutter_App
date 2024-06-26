import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/About_page.dart';
import 'package:news_app/Help.dart';
import 'package:news_app/json_file.dart';
import 'package:news_app/Settings_page.dart';

void main() {
  runApp(const News());
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: News_app(),
    );
  }
}

class News_app extends StatefulWidget {
  const News_app({super.key});

  @override
  State<News_app> createState() => _News_appState();
}

class _News_appState extends State<News_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Articals",
            style: GoogleFonts.aclonica(),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[300],
        ),
        body: MyApiCallWidget(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Center(
                  child: Text(
                    'Articals',
                    style: GoogleFonts.aclonica()
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home',style: GoogleFonts.aclonica()),
                onTap: () {
                  // Navigate to home screen
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>News()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings',style: GoogleFonts.aclonica()),
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>page()));
                },
              ),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text('Help',style: GoogleFonts.aclonica()),
                onTap: () {
                  // Navigate to about screen
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About',style: GoogleFonts.aclonica()),
                onTap: () {
                  // Navigate to about screen
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                },
              ),
              Divider(),
              Center(child: Text("Copyrights@",style: GoogleFonts.aclonica(),))
            ],
          ),
        ));
  }
}
