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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                  onPressed: calcularIMC,
                  child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 20,),
                  ),
                ),
              ),
            ),
            Text('Info', style: TextStyle(fontSize: 35, color: Colors.deepPurple), textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}

void calcularIMC() {}
