import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HomePedirTaxi extends StatefulWidget {
  const HomePedirTaxi({Key? key}) : super(key: key);

  @override
  _HomePedirTaxiState createState() {
    return _HomePedirTaxiState();
  }
}

class _HomePedirTaxiState extends State<HomePedirTaxi> {

  TextEditingController controllerORIGEN=TextEditingController();//Se declaran los controladores que guardan las respuestas(variables)
  TextEditingController controllerREFERENCIA_ORIGEN=TextEditingController();
  TextEditingController controllerDESTINO=TextEditingController();
  TextEditingController controllerREFERENCIA_DESTINO=TextEditingController();

  final formKey=GlobalKey<FormState>();//Se declara una globalkey (Para acceder desde cualquier lugar)

  FocusNode focusREFERENCIA_ORIGEN=FocusNode();//Se declara la variable focus que ayudan a pasar al siguiente cuadro de texto
  FocusNode focusDESTINO=FocusNode();
  FocusNode focusREFERENCIA_DESTINO=FocusNode();
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

  void adddata_viajes(){//Función que llama a la base de datos para enviar los datos
    var url="http://192.168.1.69/taxi_app/adddata_viajes.php";// IpDeComputadora/NombreDeCarpeta/NombreDelArchivoPHP
    // El archivo es el php que enlaza con la base de datos
    http.post(Uri.parse(url), body: {//Se envian los datos (ingresados por el usuario) de los controladores a cada atributo de la tabla en la base de datos
      "ORIGEN": controllerORIGEN.text,
      "REFERENCIA_ORIGEN": controllerREFERENCIA_ORIGEN.text,
      "DESTINO": controllerDESTINO.text,
      "REFERENCIA_DESTINO": controllerREFERENCIA_DESTINO.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700], //Color de la barra superior
        foregroundColor: Colors.black, //Color principal de la barra superior
        title: const Text(
          "TAXI APP",//Titulo en la barra superior
          style: TextStyle(fontWeight: FontWeight.bold,),//Negritas
        ),
      ),
      drawer: Drawer( //Cajon de Menú
        child: ListView( //lista de opciones
          children: <Widget>[
            DrawerHeader( //Encabezado
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.black38, Colors.yellow]),
              ),
              child: Row( //Contenido del encabezado
                children: <Widget>[
                  Image.asset("assets/logo.png"),
                  const SizedBox( //Espacio entre imagen y texto
                    width: 10,
                  ),
                  const Text(
                    "Menú",
                    style: TextStyle(fontSize: 40, color: Colors.white,),
                  ),
                ],
              ),
            ),
            ListTile( //Opción de registro para taxistas
              leading: Image.asset("assets/icono_taxi.png"),
              title: const Text(
                "Pertenecer a TAXI APP",
                style: TextStyle(fontSize: 17,),
              ),
              onTap: () {
                Navigator.pop(context); //Desaparece el drawer automaticamente
                Navigator.of(context).pushNamed("/OpcionesDeRegistro"); //Manda llamar a la pantalla de Opciones De Registro
              },
            ),
          ],
        ),
      ),
      body: Padding( //Espacio entre los margenes de la pantalla y el contenido
        padding: const EdgeInsets.all(10), //Tamaño del espacio
        child: Form( //Widget de Formularios
          key: formKey, //Se usa la globalkey
          child: Column( //Contenido
            children: <Widget>[
              Container( //Encierra el campo de texto para agregar decoracion
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), //Borde circular
                  border: Border.all(color: Colors.yellow) //Color de borde
                ),
                child: TextFormField(
                  controller: controllerORIGEN, //Se indica el controlador correspondiente a este cuadro de texto
                  style: const TextStyle(fontSize: 18), //Tamaño de texto
                  decoration: const InputDecoration(hintText:"Origen", border: InputBorder.none), //Se le quita el borde al cuadro de texto
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Campo Obligatorio";
                    }
                    return null;
                  },
                  onEditingComplete: () => requestFocus(context, focusREFERENCIA_ORIGEN),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                  textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
                ),
              ),
              const SizedBox(//Espacio
                height: 15,
              ),
              Container( //Encierra el campo de texto para agregar decoracion
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), //Borde circular
                    border: Border.all(color: Colors.yellow) //Color de borde
                ),
                child: TextFormField(
                  controller: controllerREFERENCIA_ORIGEN, //Se indica el controlador correspondiente a este cuadro de texto
                  style: const TextStyle(fontSize: 18), //Tamaño de texto
                  decoration: const InputDecoration(hintText:"Referencia del Origen (Opcional)", border: InputBorder.none), //Se le quita el borde al cuadro de texto
                  focusNode: focusREFERENCIA_ORIGEN,//Se indica la variable focus correspondiente a este cuadro de texto
                  onEditingComplete: () => requestFocus(context, focusDESTINO),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                  textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
                ),
              ),
              const SizedBox(//Espacio
                height: 15,
              ),
              Container( //Encierra el campo de texto para agregar decoracion
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), //Borde circular
                    border: Border.all(color: Colors.yellow) //Color de borde
                ),
                child: TextFormField(
                  controller: controllerDESTINO, //Se indica el controlador correspondiente a este cuadro de texto
                  style: const TextStyle(fontSize: 18), //Tamaño de texto
                  decoration: const InputDecoration(hintText:"Destino", border: InputBorder.none), //Se le quita el borde al cuadro de texto
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Campo Obligatorio";
                    }
                    return null;
                  },
                  focusNode: focusDESTINO,//Se indica la variable focus correspondiente a este cuadro de texto
                  onEditingComplete: () => requestFocus(context, focusREFERENCIA_DESTINO),//Se manda llamar la función que cambia de cuadro de texto indicandole a cual queremos ir
                  textInputAction: TextInputAction.next,//Se cambia la tecla listo por siguiente en el teclado
                ),
              ),
              const SizedBox(//Espacio
                height: 15,
              ),
              Container( //Encierra el campo de texto para agregar decoracion
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), //Borde circular
                    border: Border.all(color: Colors.yellow) //Color de borde
                ),
                child: TextFormField(
                  controller: controllerREFERENCIA_DESTINO, //Se indica el controlador correspondiente a este cuadro de texto
                  style: const TextStyle(fontSize: 18), //Tamaño de texto
                  decoration: const InputDecoration(hintText:"Referencia del Destino (Opcional)", border: InputBorder.none), //Se le quita el borde al cuadro de texto
                  focusNode: focusREFERENCIA_DESTINO,//Se indica la variable focus correspondiente a este cuadro de texto
                ),
              ),
              const SizedBox(//Espacio
                height: 25,
              ),
              RaisedButton(//Botón
                child: const Text("SOLICITAR",
                  style: TextStyle(fontSize: 20,),
                ),
                color: Colors.yellow, //Color del botón
                textColor: Colors.black,//Color del texto del botón
                onPressed: () async{
                  if(formKey.currentState!.validate()){//Se comprueba que los cuadros de texto contengan algo
                    var ping=await internetConnectivity(); //Se manda llamar la función que comprueba la conexión a internet para obtener una respuesta
                    if(ping==true){ //Si hay conexión a internet
                      adddata_viajes();//Se manda llamar la función que llama a la base de datos para enviar los datos
                    }else{ //Si no hay conexión a internet
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