import 'package:flutter/material.dart';
import 'package:isil_flutter01/homescreen.dart';


class Login extends StatelessWidget {
  const Login({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MainScreen(
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
   
  final TextEditingController _textControllerUser = TextEditingController();
  final TextEditingController _textControllerPassword = TextEditingController();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ISIL',),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                  image: NetworkImage(
                      'https://www.brandemia.org/wp-content/uploads/2011/10/logo_isil_negativo.jpg')),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _textControllerUser,
                decoration: const InputDecoration(
                    labelText: 'Ingresa tu nombre', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _textControllerPassword,
                decoration: const InputDecoration(
                    labelText: 'Ingrese Password', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              
              const Divider(),
                            
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => HomeScren()));
                  },
                  child: const Text('Aceptar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


