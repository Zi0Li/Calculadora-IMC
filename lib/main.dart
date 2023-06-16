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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String infoText = 'Informe seus dados!';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(onPressed: resetControllers, icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Color(0xfff3f3f3),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person,
                size: 120,
                color: Colors.deepPurpleAccent,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Seu peso(kg):',
                    labelStyle:
                        TextStyle(fontSize: 20, color: Colors.deepPurpleAccent)),
                style: TextStyle(fontSize: 25, color: Colors.purpleAccent),
                controller: weightController,
                validator: (value){
                  if(value != null && value.isEmpty){
                    return 'Insira seu peso!';
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Altura(cm):',
                    labelStyle:
                        TextStyle(fontSize: 20, color: Colors.deepPurpleAccent)),
                style: TextStyle(fontSize: 25, color: Colors.purpleAccent),
                controller: heightController,
                validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Insira sua altura!';
                    }
                      return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent),
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        calculateIMC();
                      }
                    },
                    child: Text(
                      'Calcular',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                infoText,
                style: TextStyle(fontSize: 35, color: Colors.deepPurple),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  void resetControllers() {
    setState(() {
      heightController.text = '';
      weightController.text = '';
      infoText = 'Informe seus dados!';
      formKey = GlobalKey<FormState>();
    });
  }

  void calculateIMC() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text)/100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        infoText = 'Abaixo do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        infoText = 'Peso ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 40) {
        infoText = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
      }
    });
  }
}