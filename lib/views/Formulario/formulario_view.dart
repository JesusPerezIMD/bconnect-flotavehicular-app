// ignore_for_file: file_names
import 'dart:convert';
import 'package:bconnect_formulario/app_route.dart';
import 'package:bconnect_formulario/app_theme.dart';
import 'package:bconnect_formulario/constants.dart';
import 'package:bconnect_formulario/env.dart';
import 'package:bconnect_formulario/views/account/account_view.dart';
import 'package:bconnect_formulario/views/Formulario/info_view.dart';
import 'package:bconnect_formulario/views/Formulario/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
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
  FirebaseUser? firebaseUser;
  BCColaborador? colaborador;
  bool isValid = true;
  bool isValidCustomer = true;
  bool isLoadingButton = false;
  Customer? selectedCustomer;
  String whatsappNumber = Environment().WHATSAPP_NUMBER;
  String? collaboratorId = '';
  String? division = '';
  String? compania = '';
  String? puesto='';
  String? apellido_empleado = '';
  String? nombre_empleado = '';
  String? telefono = '';
  String? encuesta = '';
  Capacitacion? oencuesta;
  List<Capacitacion> encuestas = [];
  String? userid = '';
  String serviceName=Environment().SERVICE_NAME;

  Future<void> getEncuestas(String division) async {
    var result = await BConnectService().getForms(division, serviceName);
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
      userid = user?.sId!;
      getEncuestas(userid!);
    } catch (e) {
      await Navigator.pushNamedAndRemoveUntil(
          context, AppRoute.loginRoute, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userInitials =
        '${(user?.names ?? '') == '' ? '' : (user?.names ?? '').substring(0, 1)}${(user?.lastNames ?? '') == '' ? '' : (user?.lastNames ?? '').substring(0, 1)}';

    final lastRecord = selectedCustomer?.ultimoCenso ?? '';
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
                        Text(lastRecord != ''
                            ? 'Último registro: ${DateFormat('dd-MM-yyyy h:mm a').format(DateTime.parse(lastRecord).toLocal())}'
                            : '')
                      ]))))),
    );
    // );
  }

  DropdownButtonFormField ddlEncuestas() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        hintText: 'Seleccione una Formulario',
        border: InputBorder.none,
        filled: false,
        fillColor: Color.fromRGBO(204, 204, 204, 80),
        hintStyle: TextStyle(fontWeight: FontWeight.bold)),
      value: oencuesta,
      items: encuestas.isNotEmpty
        ? encuestas.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.bc_nombre.toString()),
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
          return 'Seleccione un formulario';
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

  void showValidForm() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(msgErrorFormulario),
        backgroundColor: Colors.red,
      ),
    );
  }

  SizedBox btnSave(BuildContext context) { // Asegúrate de pasar el contexto
  return SizedBox(
    width: 600,
    height: 50,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ElevatedButton(
        onPressed: isLoadingButton 
          ? null 
          : () {
              // Navegación a QuestionsView
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionsView()),
              );
            },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: !isLoadingButton
          ? const Text(
              'Enviar Solicitud',
              style: TextStyle(fontSize: 16),
            )
          : Row(
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
                const Text(
                  'Enviando...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
      ),
    ),
  );
}

  onSubmit() {
    if (_formKey.currentState!.validate() && isValid) {
      _formKey.currentState?.save();
      send(context);
    } else {
      showValidForm();
    }
  }

  void send(BuildContext context) async {
    setState(() {
      isLoadingButton = true;
      isValidCustomer = true;
    });

    encuesta = oencuesta?.bc_nombre;
    collaboratorId = colaborador?.codemp;
    nombre_empleado = colaborador?.names!;
    apellido_empleado = colaborador?.lastNames;
    telefono = colaborador?.phone;
    puesto= colaborador?.puesto;

    String? url = oencuesta?.bc_url?.replaceAll("[encuesta_value]", encuesta!);
    url = url?.replaceAll('[nombreemp_value]', nombre_empleado!);
    url = url?.replaceAll('[telefono_value]', telefono!);
    url = url?.replaceAll('[apellidoemp_value]', apellido_empleado!);
    url = url?.replaceAll('[codemp_value]', collaboratorId!);
    url = url?.replaceAll('[Puesto_value]', puesto!);

    Uri uri = Uri.parse(url!);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se puede abrir $url';
    }

    try {
      if (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android) {
        if (!mounted) return;
      }

      if (!mounted) return;
      await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => InfoPage(
                  user ?? BCUser(), selectedCustomer ?? Customer(), encuesta!)),
          (route) => false);

      setState(() {
        _formKey.currentState!.reset();
        selectedCustomer = null;
        isLoadingButton = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        isLoadingButton = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          content: Text(
              "Ocurrió un error. Intente de nuevo más tarde.")));
    }
  }
}
