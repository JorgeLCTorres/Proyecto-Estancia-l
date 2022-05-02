import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ListaDeSitios extends StatefulWidget {
  const ListaDeSitios({Key? key}) : super(key: key);

  @override
  _ListaDeSitiosState createState() {
    return _ListaDeSitiosState();
  }
}

class _ListaDeSitiosState extends State<ListaDeSitios> {

  Future<List> getdata_SITIOS() async{
    final response=await http.get(Uri.parse("http://192.168.1.69/taxi_app/getdata_SITIOS.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700], //Color de la barra superior
        foregroundColor: Colors.black, //Color principal de la barra superior
        title: const Text(
          "Sitios Registrados", //Titulo en la barra superior
          style: TextStyle(fontWeight: FontWeight.bold,), //Negritas
        ),
      ),
      body: FutureBuilder<List>(
        future: getdata_SITIOS(), //Se llama el listado de los sitios
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error); //Si existe un error (que este vacio el listado o algo similar) se muestra el error por consola
          return snapshot.hasData //Se retorna la información
              ? ListaSitiosRegistrados( //Si no hay un error, se llama la clase que hace la lista
            list: snapshot.data??[], //Pasandole la información
          )
              : const Center( //Si se demora la consulta, se muestra una barra circular de carga
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ListaSitiosRegistrados extends StatelessWidget {
  const ListaSitiosRegistrados({Key? key, required this.list}) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return Padding( //Espacio entre los margenes de la pantalla y el contenido
      padding: const EdgeInsets.all(13), //Tamaño del espacio
      child: ListView.builder( //Lista del contenido
        itemCount: list.length,//Se declara la cantidad de elementos en la lista
        itemBuilder: (BuildContext context, int i){
          return Card(
            child: Text(
              list[i]['SITIO'],
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}