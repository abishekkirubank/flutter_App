import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Second_page.dart';

class MyApiCallWidget extends StatefulWidget {
  @override
  _MyApiCallWidgetState createState() => _MyApiCallWidgetState();
}

class _MyApiCallWidgetState extends State<MyApiCallWidget> {
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4d3aeb33c60a4a5cb5d0c3bdde6b9718'));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return json.decode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load data');
    }
  }
  bool _slowAnimations = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      // Text at the top
      Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
        child: Text('Top News', // Add your desired text here
            style: GoogleFonts.aclonica()),
      ),
      Container(
        child: Expanded(
          child: FutureBuilder<Map<String, dynamic>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    // Access the list of articles from the API response
                    List<dynamic> articles = snapshot.data?['articles'];
                    // Access the title of the current article
                    String title =
                        articles[index]['title'] ?? "No title available";
                    String author =
                        articles[index]['author'] ?? "No author available";
                    String urlToImage =
                        articles[index]['urlToImage'] ?? "No image available";
                    String description = articles[index]["description"] ??
                        "No Description available";
                    String url = articles[index]["url"] ?? "No url available";
                    String content =
                        articles[index]["content"] ?? "No content available";
                    String publishedAt = articles[index]["publishedAt"] ??
                        "No published date available";

                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Second_page(
                                      title: title,
                                      author: author,
                                      urlToImage: urlToImage,
                                    content: content,
                                    description: description,
                                    url: url,
                                  publishedAt: publishedAt)));
                        },
                        child: GridTile(
                          child: Card(
                            child: Column(
                              children: [
                                urlToImage != null
                                    ? Image.network(
                                        urlToImage,
                                        width: 150,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      )
                                    : Text('image'),
                                // Display the title of the article
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(3, 8, 8, 0),
                                    child: Text(
                                      author,
                                      maxLines: 1,
                                      // Limit the maximum number of lines
                                      overflow: TextOverflow
                                          .ellipsis, // Handle overflow
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(3, 8, 8, 0),
                                    child: Text(
                                      title,
                                      // Limit the maximum number of lines
                                      overflow: TextOverflow.ellipsis, // Handle overflow
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      description,
                                       // Limit the maximum number of lines
                                      overflow: TextOverflow
                                          .ellipsis, // Handle overflow
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      content,
                                      // Limit the maximum number of lines
                                      overflow: TextOverflow
                                          .ellipsis, // Handle overflow
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      url,
                                      maxLines:
                                          1, // Limit the maximum number of lines
                                      overflow: TextOverflow
                                          .ellipsis, // Handle overflow
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      publishedAt,
                                      maxLines:
                                          1, // Limit the maximum number of lines
                                      overflow: TextOverflow
                                          .ellipsis, // Handle overflow
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                  itemCount: snapshot.data?['articles'].length,
                );
              }
            },
          ),
        ),
      ),
    ])));
  }
}
