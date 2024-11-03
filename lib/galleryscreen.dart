
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});
  
  @override
  GalleryScreenState createState() => GalleryScreenState();


}

class GalleryScreenState extends State<GalleryScreen> {

  final List<int> idsPhotos = [1, 2, 4, 7, 10];
  List<dynamic> photos = [];
  bool isLoad = false;

  @override
  void initState() {
    super.initState();
  
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria de fotos'),
      ),
      body: isLoad ?
      const Center(
        child: CircularProgressIndicator(),
      ): 
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
          ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          final photo = photos[index];
          return Card(
            child: Column(
              children: [
                Image.network(
                  photo['thumbnailUrl'],
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                    'https://carrerasadistancia.pe/logos/original/logo-isil.png',
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100, 
                    ); 
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    photo['title'],
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  )
              ],
            ),
          );
        },
        ),
    );
  }
  
  Future<void> loadData() async {
    List<dynamic> photosAPI = [];

    setState(() {
      isLoad = true;
    });

    for(int id in idsPhotos) {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$id'));
        
      if(response.statusCode == 200) {
        var data = response.body;
        var objJson = jsonDecode(data);
        photosAPI.add(objJson);
      } 
    }

    setState(() {
      photos = photosAPI;
      isLoad = false;
    });
  }
}
