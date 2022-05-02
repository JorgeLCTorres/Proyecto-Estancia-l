import 'package:flutter/material.dart';

class OpcionesDeRegistro extends StatefulWidget {
  const OpcionesDeRegistro({Key? key}) : super(key: key);

  @override
  _OpcionesDeRegistroState createState() {
    return _OpcionesDeRegistroState();
  }
}

class _OpcionesDeRegistroState extends State<OpcionesDeRegistro> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700], //Color de la barra superior
        foregroundColor: Colors.black, //Color principal de la barra superior
        title: const Text(
          "Registro",//Titulo en la barra superior
          style: TextStyle(fontWeight: FontWeight.bold,),//Negritas
        ),
      ),
      body: Padding( //Espacio entre los margenes de la pantalla y el contenido
        padding: const EdgeInsets.all(10), //Tamaño del espacio
        child: ListView( //Lista del contenido
          children: <Widget>[
            RaisedButton( //Primer botón
              color: Colors.yellow, //Color del botón
              textColor: Colors.black, //Color del texto del botón
              child: Padding( //Espacio entre el botón y la columna que contiene los textos
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),//Tamaño del espacio (Solo se aplicó en Top y Bottom)
                child: Column(
                  children: const <Widget>[
                    Text(
                      "Crear Flotilla (Sitio)",
                      style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      "Ser líder de una flotilla con taxis propios o de otras personas",
                      style: TextStyle(fontSize: 11,),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/RegistroDependientePrimera");//Manda llamar a la primera pantalla de Registro Dependiente
              },
            ),
            const SizedBox(//Espacio entre botones
              height: 25,
            ),
            RaisedButton(//Segundo botón
              color: Colors.yellow, //Color del botón
              textColor: Colors.black,//Color del texto del botón
              child: Padding(//Espacio entre el botón y la columna que contiene los textos
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),//Tamaño del espacio (Solo se aplicó en Top y Bottom)
                child: Column(
                  children: const <Widget>[
                    Text(
                      "Registrar Dependiente",
                      style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      "Registra conductores y taxis en una flotilla existente",
                      style: TextStyle(fontSize: 11,),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/RegistroDependienteSegunda");//Manda a la segunda pantalla de Registro Dependiente
              },
            ),
            const SizedBox(//Espacio entre botones
              height: 25,
            ),
            RaisedButton(//Tercer botón
              color: Colors.yellow, //Color del botón
              textColor: Colors.black,//Color del texto del botón
              child: Padding(//Espacio entre el botón y la columna que contiene los textos
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),//Tamaño del espacio (Solo se aplicó en Top y Bottom)
                child: Column(
                  children: const <Widget>[
                    Text(
                      "Registrar Independiente",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      "Registrate o registra conductores para tus propios taxis",
                      style: TextStyle(fontSize: 11,),
                    ),
                  ],
                ),
              ),
              onPressed: (){
                Navigator.of(context).pushNamed("/RegistroIndependiente");//Manda a la pantalla de Registro Independiente
              },
            ),
          ],
        ),
      ),
    );
  }
}