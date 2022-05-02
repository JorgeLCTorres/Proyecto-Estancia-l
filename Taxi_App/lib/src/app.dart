import 'package:flutter/material.dart';
import 'package:taxi_app/src/screens/home_pedir_taxi.dart';
import 'package:taxi_app/src/screens/opciones_de_registro.dart';
import 'package:taxi_app/src/screens/registro_independiente.dart';
import 'package:taxi_app/src/screens/listo_registro_independiente.dart';
import 'package:taxi_app/src/screens/error_registro_independiente.dart';
import 'package:taxi_app/src/screens/registro_dependiente_primera.dart';
import 'package:taxi_app/src/screens/registro_dependiente_segunda.dart';
import 'package:taxi_app/src/screens/lista_de_sitios.dart';
import 'package:taxi_app/src/screens/listo_registro_dependiente.dart';
import 'package:taxi_app/src/screens/error_registro_dependiente.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TAXI APP',
      theme: ThemeData.dark(),
      initialRoute: "/", //Se declara la pantalla principal
      routes: { //Se declaran todas las rutas de las pantallas
        "/": (BuildContext context) => const HomePedirTaxi(),
        "/OpcionesDeRegistro": (BuildContext context) => const OpcionesDeRegistro(),
        "/RegistroIndependiente": (BuildContext context) => const RegistroIndependiente(),
        "/ListoRegistroIndependiente": (BuildContext context) => const ListoRegistroIndependiente(),
        "/ErrorRegistroIndependiente": (BuildContext context) => const ErrorRegistroIndependiente(),
        "/RegistroDependientePrimera": (BuildContext context) => const RegistroDependientePrimera(),
        "/RegistroDependienteSegunda": (BuildContext context) => const RegistroDependienteSegunda(),
        "/ListaDeSitios": (BuildContext context) => const ListaDeSitios(),
        "/ListoRegistroDependiente": (BuildContext context) => const ListoRegistroDependiente(),
        "/ErrorRegistroDependiente": (BuildContext context) => const ErrorRegistroDependiente(),
      },
    );
  }
}
