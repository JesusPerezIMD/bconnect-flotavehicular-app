// ignore_for_file: file_names
import 'dart:convert';
import 'package:bconnect_formulario/app_route.dart';
import 'package:bconnect_formulario/views/account/account_view.dart';
import 'package:bconnect_formulario/views/Formulario/questions_view.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../components/components.dart';
import '../../helpers/helpers.dart';
import '../../services/services.dart';
import 'package:bconnect_formulario/components/navigation_bar_component.dart';

class CapacitacionPage extends StatefulWidget {
  const CapacitacionPage({super.key});

  @override
  State<CapacitacionPage> createState() => _CapacitacionPageState();
}

class _CapacitacionPageState extends State<CapacitacionPage> {
  final _formKey = GlobalKey<FormState>();
  BCUser? user;
  String? userid = '';
  BCColaborador? colaborador;
  String? colaboradorid = '';
  FirebaseUser? firebaseUser;
  bool isValid = true;
  bool isValidCustomer = true;
  bool isLoadingButton = false;
  String? encuesta = '';
  getSolicitud? oencuesta;
  List<getSolicitud> encuestas = [];
  List<getOneSolicitud> encuestasOne = [];
  List<Catalogos> catalogos = [];
  
  Future<void> getEncuestas(String colaboradorid) async {
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

  Future<void> getOneEncuestas(String id) async {
    var result = await BConnectService().getOneForms(id);
    if (mounted) {
      setState(() {
        encuestasOne = result; 
      });
    }
  }

  Future<void> getCat(String bcVdivision) async {
    var result = await BConnectService().getCatalogos(bcVdivision);
    if (mounted) {
      setState(() {
        catalogos = [result]; 
      });
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      if (mounted) {
        await initUser(context);
        setState(() {});
      }
    });
    super.initState();
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
      colaboradorid = colaborador?.codemp;
      getEncuestas(colaboradorid!);
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
      bottomNavigationBar: const NavigationBarComponenet(0),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 500,
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Formulario*",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: ddlEncuestas()),
                        const SizedBox(
                          height: 10,
                        ),
                        btnSave(context),
                        const SizedBox(
                          height: 20,
                        ),
                      ]))))),
    );
    // );
  }

  DropdownButtonFormField ddlEncuestas() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        hintText: 'Seleccione un Formulario',
        border: InputBorder.none,
        filled: false,
        fillColor: Color.fromRGBO(204, 204, 204, 80),
        hintStyle: TextStyle(fontWeight: FontWeight.bold)),
      value: oencuesta,
      items: encuestas.isNotEmpty
        ? encuestas.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.bc_folio.toString()),
            );
          }).toList()
        : [DropdownMenuItem(
            value: "NoData",
            child: Text("No existen datos"),
          )], // Agrega esta línea
      icon: const Icon(
        Icons.expand_more,
        color: Colors.red,
      ),
      validator: (value) {
        if (value == "NoData") {
          return 'No hay datos disponibles';
        }
        if (value == null) {
          return 'Seleccione un Formulario';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          if (value == "NoData") {
            return;
          }
          oencuesta = value;
        });
      }
    );
  }

  SizedBox btnSave(BuildContext context) {
  return SizedBox(
    width: 600,
    height: 50,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ElevatedButton(
        onPressed: isLoadingButton
            ? null
            : () async {
                setState(() {
                  isLoadingButton = true; // Mostrar el círculo de carga
                });

                // Esperar a que getCat() termine antes de navegar
                await getCat(oencuesta!.bc_vdivision!);
                await getOneEncuestas(oencuesta!.bc_asignacionvehiculoid!);
                // Ocultar el círculo de carga
                setState(() {
                  isLoadingButton = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionsView(
                      catalogos: catalogos,
                      encuestasOne: encuestasOne,
                    ),
                  ),
                );
              },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: isLoadingButton
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    padding: const EdgeInsets.all(5.0),
                    child: const CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Procesando...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )
            : const Text(
                'Seleccione',
                style: TextStyle(fontSize: 16),
              ),
      ),
    ),
  );
}

}
