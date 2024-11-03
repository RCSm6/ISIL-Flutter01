import 'package:flutter/material.dart';
import 'package:isil_flutter01/galleryscreen.dart';

class HomeScren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen',),
        ),
        body: Center(
          child: Row (
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context);
                }, 
                child: const Text("Back to Main Screen."),
              ),
              ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const GalleryScreen()));
              }, 
              child: const Text("Ingresar a galeria de fotos"),
              )
              ],
          )
          
        )
      ),
    );
  }

}