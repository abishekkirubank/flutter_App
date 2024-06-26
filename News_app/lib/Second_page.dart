import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Second_page extends StatefulWidget {
  final String title;
  final String author;
  final String urlToImage;
  final String url;
  final String content;
  final String description;
  final String publishedAt;
  Second_page(
      {super.key,
      required this.title,
      required this.author,
      required this.urlToImage,
      required this.description,
      required this.url,
      required this.content,
      required this.publishedAt});
  @override
  State<Second_page> createState() => _Second_pageState();
}

class _Second_pageState extends State<Second_page> {
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
      body: Center(
        child: Column(
          children: [
            Image.network(widget.urlToImage),
            Text("TITLE: ${widget.title}"),
            Text("DESCRIPTION: ${widget.description}"),
            Text("CONTENT: ${widget.content}"),
            Text("URL: ${widget.url}"),
            Text("AUTHOR: ${widget.author}"),
            Text("PUBLISHED AT: ${widget.publishedAt}"),
          ],
        ),
      ),
    );
  }
}
