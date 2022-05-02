import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class RegistroDependienteSegunda extends StatefulWidget {
  const RegistroDependienteSegunda({Key? key}) : super(key: key);

  @override
  _RegistroDependienteSegundaState createState() {
    return _RegistroDependienteSegundaState();
  }
}

class _RegistroDependienteSegundaState extends State<RegistroDependienteSegunda> {

  TextEditingController controllerNOMBRE_DUENO=TextEditingController();//Se declaran los controladores que guardan las respuestas(variables)
  TextEditingController controllerNOMBRE=TextEditingController();
  TextEditingController controllerAPELLIDO=TextEditingController();
  TextEditingController controllerTELEFONO=TextEditingController();
  TextEditingController controllerDOMICILIO=TextEditingController();
  TextEditingController controllerCORREO=TextEditingController();
  TextEditingController controllerCURP=TextEditingController();
  TextEditingController controllerRFC=TextEditingController();
  TextEditingController controllerUNIDAD=TextEditingController();
  TextEditingController controllerSITIO=TextEditingController();
  TextEditingController controllerMATRICULA=TextEditingController();
  TextEditingController controllerCOLOR=TextEditingController();

  final formKey=GlobalKey<FormState>();//Se declara una globalkey (Para acceder desde cualquier lugar)

  FocusNode focusAPELLIDO=FocusNode();//Se declaran las variables focus que ayudan a pasar al siguiente cuadro de texto
  FocusNode focusTELEFONO=FocusNode();
  FocusNode focusDOMICILIO=FocusNode();
  FocusNode focusCORREO=FocusNode();
  FocusNode focusCURP=FocusNode();
  FocusNode focusRFC=FocusNode();
  FocusNode focusUNIDAD=FocusNode();
  FocusNode focusSITIO=FocusNode();
  FocusNode focusMATRICULA=FocusNode();
  FocusNode focusCOLOR=FocusNode();
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

  void adddata_dependientes(){ //Función que llama a la base de datos para enviar los datos
    var url="http://192.168.1.69/taxi_app/adddata_dependientes.php"; // IpDeComputadora/NombreDeCarpeta/NombreDelArchivoPHP
    // El archivo es el php que enlaza con la base de datos
    http.post(Uri.parse(url), body: { //Se envian los datos (ingresados por el usuario) de los controladores a cada atributo de la tabla en la base de datos
      "SITIO": controllerSITIO.text,
      "NOMBRE_DUENO": controllerNOMBRE_DUENO.text,
      "NOMBRE": controllerNOMBRE.text,
      "APELLIDO": controllerAPELLIDO.text,
      "TELEFONO": controllerTELEFONO.text,
      "DOMICILIO": controllerDOMICILIO.text,
      "CORREO": controllerCORREO.text,
      "CURP": controllerCURP.text,
      "RFC": controllerRFC.text,
      "UNIDAD": controllerUNIDAD.text,
      "MATRICULA": controllerMATRICULA.text,
      "COLOR": controllerCOLOR.text
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
              const Text( //Primera indicación
                "Por favor, ingresa el nombre completo del dueño de la unidad a registrar",
                style: TextStyle(fontSize: 18,),
              ),
              const SizedBox( //Espacio
                height: 1,
              ),
              TextFormField(//Primer cuadro de texto
                controller: controllerNOMBRE_DUENO,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Nombre Completo"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
              ),
              const SizedBox(//Espacio
                height: 30,
              ),
              const Text(//Segunda indicación
                "Por favor, agrega la siguiente información sobre el conductor y la unidad",
                style: TextStyle(fontSize: 18,),
              ),
              const SizedBox(//Espacio
                height: 1,
              ),
              TextFormField(//Segundo cuadro de texto
                controller: controllerNOMBRE,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Nombre(s)"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                onEditingComplete: () => requestFocus(context, focusAPELLIDO),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Tercer cuadro de texto
                controller: controllerAPELLIDO,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Apellido(s)"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusAPELLIDO,//Se indica la variable focus correspondiente a este cuadro de texto
                onEditingComplete: () => requestFocus(context, focusTELEFONO),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Cuarto cuadro de texto
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
              TextFormField(//Quinto cuadro de texto
                controller: controllerDOMICILIO,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Domicilio"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusDOMICILIO,//Se indica la variable focus correspondiente a este cuadro de texto
                onEditingComplete: () => requestFocus(context, focusCORREO),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Sexto cuadro de texto
                controller: controllerCORREO,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Correo Electrónico"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusCORREO,//Se indica la variable focus correspondiente a este cuadro de texto
                onEditingComplete: () => requestFocus(context, focusCURP),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
                keyboardType: TextInputType.emailAddress,//Se cambia el tipo de teclado por uno especial para correos
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Septimo cuadro de texto
                controller: controllerCURP,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"CURP"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusCURP,//Se indica la variable focus correspondiente a este cuadro de texto
                onEditingComplete: () => requestFocus(context, focusRFC),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Octavo cuadro de texto
                controller: controllerRFC,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Registro Federal de Contribuyentes (RFC)"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusRFC,//Se indica la variable focus correspondiente a este cuadro de texto
                onEditingComplete: () => requestFocus(context, focusUNIDAD),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Noveno cuadro de texto
                controller: controllerUNIDAD,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Clave de Unidad"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusUNIDAD,//Se indica la variable focus correspondiente a este cuadro de texto
                onEditingComplete: () => requestFocus(context, focusSITIO),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Decimo cuadro de texto
                controller: controllerSITIO,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Sitio"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusSITIO,//Se indica la variable focus correspondiente a este cuadro de texto
                onEditingComplete: () => requestFocus(context, focusMATRICULA),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
              ),
              ListTile( //Enlace hacia la pantalla de sitios registrados
                title: const Text(
                  "Ver sitios",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right), //Icono de la flecha hacia la derecha
                onTap: () {
                  Navigator.of(context).pushNamed("/ListaDeSitios");
                },
              ),
              TextFormField(//Onceavo cuadro de texto
                controller: controllerMATRICULA,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Matrícula"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusMATRICULA,//Se indica la variable focus correspondiente a este cuadro de texto
                onEditingComplete: () => requestFocus(context, focusCOLOR),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
              ),
              const SizedBox(//Espacio
                height: 5,
              ),
              TextFormField(//Doceavo cuadro de texto
                controller: controllerCOLOR,//Se indica el controlador correspondiente a este cuadro de texto
                decoration: const InputDecoration(labelText:"Color del Auto"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obligatorio";
                  }
                  return null;
                },
                focusNode: focusCOLOR,//Se indica la variable focus correspondiente a este cuadro de texto
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
                  if(formKey.currentState!.validate()){ //Se comprueba que los cuadros de texto contengan algo
                    var ping=await internetConnectivity(); //Se manda llamar la función que comprueba la conexión a internet para obtener una respuesta
                    if(ping==true){ //Si hay conexión a internet
                      adddata_dependientes();//Se manda llamar la función que llama a la base de datos para enviar los datos
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