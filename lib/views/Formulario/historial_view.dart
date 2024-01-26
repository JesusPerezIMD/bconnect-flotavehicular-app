import 'dart:convert';
import 'package:bconnect_formulario/components/navigation_bar_component.dart';
import 'package:bconnect_formulario/env.dart';
import 'package:flutter/material.dart';
import 'package:bconnect_formulario/app_route.dart';
import 'package:bconnect_formulario/helpers/preferences_helper.dart';
import 'package:bconnect_formulario/views/account/account_view.dart';
import 'package:bconnect_formulario/views/Formulario/formulario_view.dart';
import '../../models/models.dart';
import '../../components/components.dart';
import 'package:intl/intl.dart';
import '../../services/bconnect_service.dart';

class HistorialCapacitacionPage extends StatefulWidget {
  final getSolicitud? responseEncuestas;
  const HistorialCapacitacionPage({Key? key, this.responseEncuestas})
      : super(key: key);
  @override
  State<HistorialCapacitacionPage> createState() =>
      _HistorialCapacitacionPageState();
}

class _HistorialCapacitacionPageState extends State<HistorialCapacitacionPage> {
  List<getSolicitud> listResponse = [];
  BCUser? user;
  FirebaseUser? firebaseUser;
  BCColaborador? colaborador;
  getSolicitud? oencuesta;
  List<getSolicitud> encuestas = [];
  String? userid = '';
  String serviceName=Environment().SERVICE_NAME;
  String codemp ='';

  Future<void> getForms(String colaboradorid) async {
    var result = await BConnectService().getForms(colaboradorid);
    if (mounted) {
      setState(() {
        if (result.isNotEmpty) {
          encuestas = result;
          oencuesta = encuestas.first;
        } else {
          encuestas = [];
          oencuesta = null;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await initUser(context);
      codemp = colaborador!.codemp!;
      await getForms(codemp);
      if (oencuesta == null) {
        if (mounted) {
          setState(() {
          });
        }
        return;
      }
    });
  }

  Future<void> initUser(BuildContext context) async {
    try {
      final jsonUser = await PreferencesHelper.getString('user');
      user = BCUser.fromJson(jsonDecode(jsonUser ?? ''));
      if (mounted && user == null) {
        await Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.loginRoute, (route) => false);
      }
      final jsonFirebaseUser =
          await PreferencesHelper.getString('firebase_user');
      firebaseUser = FirebaseUser.fromJson(jsonDecode(jsonFirebaseUser ?? ''));
      if (mounted && firebaseUser == null) {
        await Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.loginRoute, (route) => false);
      }
      final jsonColaborador = await PreferencesHelper.getString('colaborador');
      colaborador = BCColaborador.fromJson(jsonDecode(jsonColaborador ?? ''));
     
    } catch (e) {
      await Navigator.pushNamedAndRemoveUntil(
          context, AppRoute.loginRoute, (route) => false);
    }
  }

@override
Widget build(BuildContext context) {
  final userInitials =
      '${(user?.names ?? '') == '' ? '' : (user?.names ?? '').substring(0, 1)}${(user?.lastNames ?? '') == '' ? '' : (user?.lastNames ?? '').substring(0, 1)}';
  return Scaffold(
    appBar: BconnectAppBar(
      onPressed: () => {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => AccountPage(
                    user ?? BCUser(), colaborador ?? BCColaborador())))
      },
      userInitials: userInitials,
    ),
    bottomNavigationBar: const NavigationBarComponenet(1),
    body: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Historial de Encuestas",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 14,
                fontWeight: FontWeight.bold, // Puedes ajustar el estilo del título aquí
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: encuestas.length, // La cantidad de elementos en la lista
            itemBuilder: (context, index) {
              final solicitud = encuestas[index]; // Obtiene el objeto actual
              return Card(
                elevation: 2,
                child: ListTile(
                  title: Text('Folio: ${solicitud.bc_folio}'),
                  subtitle: Text('Tipo Adquisición: ${solicitud.bc_tipoadquisicionname}'),
                  // Agrega más campos del objeto solicitud que desees mostrar
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

}
