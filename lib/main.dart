import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      backgroundColor: Color(0xfff3f3f3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Icon(
            Icons.person,
            size: 120,
            color: Colors.deepPurpleAccent,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Seu peso(kg):',
                labelStyle:
                    TextStyle(fontSize: 20, color: Colors.deepPurpleAccent)),
            style: TextStyle(fontSize: 25, color: Colors.purpleAccent),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Altura(cm):',
                labelStyle:
                TextStyle(fontSize: 20, color: Colors.deepPurpleAccent)),
            style: TextStyle(fontSize: 25, color: Colors.purpleAccent),
          )
        ],
      ),
    );
  }
}
