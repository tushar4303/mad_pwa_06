import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The list that contains information about photos
  List _loadedPhotos = [];

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/photos';

    HttpClient client = HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(apiUrl));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List data = json.decode(content);

    setState(() {
      _loadedPhotos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: _loadedPhotos.isEmpty
            ? Center(
                child: ElevatedButton(
                  onPressed: _fetchData,
                  child: const Text('Load Photos'),
                ),
              )
            // The ListView that displays photos
            : ListView.builder(
                itemCount: _loadedPhotos.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ListTile(
                    leading: Image.network(
                      _loadedPhotos[index]["thumbnailUrl"],
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    title: Text(_loadedPhotos[index]['title']),
                    subtitle: Text('Photo ID: ${_loadedPhotos[index]["id"]}'),
                  );
                },
              ));
  }
}
