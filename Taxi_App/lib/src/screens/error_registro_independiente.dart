import 'package:flutter/material.dart';

class ErrorRegistroIndependiente extends StatelessWidget {
  const ErrorRegistroIndependiente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700], //Color de la barra superior
        foregroundColor: Colors.black, //Color principal de la barra superior
        title: const Text(
          "Registro Independiente",//Titulo en la barra superior
          style: TextStyle(fontWeight: FontWeight.bold,),//Negritas
        ),
      ),
      body: SizedBox(//Widget para que la columna abarque el ancho de la pantalla
        width: double.infinity,//Se toma las dimensiones de la pantalla
        child: Column(//Widget de columna
          mainAxisAlignment: MainAxisAlignment.center,//Se declara que el contenido ira en el centro de la columna
          children: <Widget>[
            Image.asset("assets/error.png", //Imagen de check
              width: 300,
            ),
            const SizedBox( //Espacio
              height: 30,
            ),
            const Text( //Texto
              "ERROR DE CONEXIÓN",
              style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
}