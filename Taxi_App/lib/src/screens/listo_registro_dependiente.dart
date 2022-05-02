import 'package:flutter/material.dart';

class ListoRegistroDependiente extends StatelessWidget {
  const ListoRegistroDependiente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700], //Color de la barra superior
        foregroundColor: Colors.black, //Color principal de la barra superior
        title: const Text(
          "Registro Flotilla",//Titulo en la barra superior
          style: TextStyle(fontWeight: FontWeight.bold,),//Negritas
        ),
      ),
      body: SizedBox(//Widget para que la columna abarque el ancho de la pantalla
        width: double.infinity,//Se toma las dimensiones de la pantalla
        child: Column(//Widget de columna
          mainAxisAlignment: MainAxisAlignment.center,//Se declara que el contenido ira en el centro de la columna
          children: <Widget>[
            Image.asset("assets/listo.png", //Imagen de check
              width: 300,
            ),
            const SizedBox( //Espacio
              height: 30,
            ),
            const Text( //Texto
              "TODO LISTO",
              style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
}