import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class RegistroDependientePrimera extends StatefulWidget {
  const RegistroDependientePrimera({Key? key}) : super(key: key);

  @override
  _RegistroDependientePrimeraState createState() {
    return _RegistroDependientePrimeraState();
  }
}

class _RegistroDependientePrimeraState extends State<RegistroDependientePrimera> {

  TextEditingController controllerNOMBRE_LIDER=TextEditingController();//Se declaran los controladores que guardan las respuestas(variables)
  TextEditingController controllerTELEFONO=TextEditingController();
  TextEditingController controllerDOMICILIO=TextEditingController();
  TextEditingController controllerSITIO=TextEditingController();

  final formKey=GlobalKey<FormState>();//Se declara una globalkey (Para acceder desde cualquier lugar)

  FocusNode focusTELEFONO=FocusNode();//Se declaran las variables focus que ayudan a pasar al siguiente cuadro de texto
  FocusNode focusDOMICILIO=FocusNode();
  FocusNode focusSITIO=FocusNode();
  void requestFocus(BuildContext context, FocusNode focusNode){//Funcion que pasa al siguiente cuadro de texto
    FocusScope.of(context).requestFocus(focusNode);
  }

  Future<bool> internetConnectivity() async { //Función que comprueba la conexión a internet mediante un ping
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;//Conectado
      }
    } on SocketException catch (_) {
      return false;//Desconectado
    }
    return false;
  }

  void adddata_flotilla(){//Función que llama a la base de datos para enviar los datos
    var url="http://192.168.1.69/taxi_app/adddata_flotilla.php";// IpDeComputadora/NombreDeCarpeta/NombreDelArchivoPHP
                                                                // El archivo es el php que enlaza con la base de datos
    http.post(Uri.parse(url), body: {//Se envian los datos (ingresados por el usuario) de los controladores a cada atributo de la tabla en la base de datos
      "SITIO": controllerSITIO.text,
      "NOMBRE_LIDER": controllerNOMBRE_LIDER.text,
      "TELEFONO": controllerTELEFONO.text,
      "DOMICILIO": controllerDOMICILIO.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700], //Color de la barra superior
        foregroundColor: Colors.black, //Color principal de la barra superior
        title: const Text(
          "Registro Flotilla", //Titulo en la barra superior
          style: TextStyle(fontWeight: FontWeight.bold,), //Negritas
        ),
      ),
      body: Padding( //Espacio entre los margenes de la pantalla y el contenido
        padding: const EdgeInsets.all(13), //Tamaño del espacio
        child: Form( //Widget de Formularios
          key: formKey, //Se usa la globalkey
          child: ListView( //Lista de contenido
            children: <Widget>[
              const Text( //Indicación
                "Por favor, completa la siguiente información sobre el lider de la flotilla (tú) y el sitio",
                style: TextStyle(fontSize: 18,),
              ),
              const SizedBox( //Espacio
                height: 1,
              ),
              TextFormField(//Primer cuadro de texto
                controller: controllerNOMBRE_LIDER,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Nombre Completo"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                onEditingComplete: () => requestFocus(context, focusTELEFONO),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Segundo cuadro de texto
                controller: controllerTELEFONO,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Número Telefónico"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusTELEFONO,//Se indica la variable focus correspondiente a este cuadro de texto
                onEditingComplete: () => requestFocus(context, focusDOMICILIO),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
                keyboardType: TextInputType.phone,//Se cambia el tipo de teclado por uno especial para telefonos
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Tercer cuadro de texto
                controller: controllerDOMICILIO,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Domicilio"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusDOMICILIO,//Se indica la variable focus correspondiente a este cuadro de texto
                onEditingComplete: () => requestFocus(context, focusSITIO),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Cuarto cuadro de texto
                controller: controllerSITIO,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Lugar del Sitio"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusSITIO,//Se indica la variable focus correspondiente a este cuadro de texto
              ),
              const SizedBox(//Espacio
                height: 25,
              ),
              RaisedButton(//Botón
                child: const Text("FINALIZAR",
                  style: TextStyle(fontSize: 20,),
                ),
                color: Colors.yellow, //Color del botón
                textColor: Colors.black,//Color del texto del botón
                onPressed: () async{
                  if(formKey.currentState!.validate()){//Se comprueba que los cuadros de texto contengan algo
                    var ping=await internetConnectivity(); //Se manda llamar la función que comprueba la conexión a internet para obtener una respuesta
                    if(ping==true){ //Si hay conexión a internet
                      adddata_flotilla();//Se manda llamar la función que llama a la base de datos para enviar los datos
                      Navigator.of(context).pushReplacementNamed("/ListoRegistroDependiente"); //Manda a la pantalla de Listo Registro Dependiente con un check
                    }else{ //Si no hay conexión a internet
                      Navigator.of(context).pushReplacementNamed("/ErrorRegistroDependiente"); //Manda a la pantalla de Listo Registro Dependiente con una equis
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}