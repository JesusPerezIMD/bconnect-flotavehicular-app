// ignore_for_file: file_names
import 'dart:convert';
import 'package:bconnect_formulario/app_route.dart';
import 'package:bconnect_formulario/app_theme.dart';
import 'package:bconnect_formulario/constants.dart';
import 'package:bconnect_formulario/env.dart';
import 'package:bconnect_formulario/views/account/account_view.dart';
import 'package:bconnect_formulario/views/Formulario/customers_component.dart';
import 'package:bconnect_formulario/views/Formulario/info_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
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
  gm.LatLng? selectedGps;
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
                        btnSave(),
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

  Future<void> _launchUrl() async {
    final url = Uri.parse(
        'https://wa.me/?text=Hola,%20te%20invito%20a%20usar%20el%20servicio%capacitacion%20para%20reportar%20oportunidades%20de%20Coca-Cola%202.5L%20Retornable%0Ahttps://wa.me/%2b$whatsappNumber?text=Censo');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch url');
    }
  }

  SizedBox btnGoogleMaps() {
    return SizedBox(
        width: 600,
        height: 50,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ElevatedButton(
              onPressed: () {
                if (selectedCustomer != null) {
                  _launchMapsUrl(
                    selectedCustomer!.latitude!,
                    selectedCustomer!.longitude!,
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // Icon(
                  //   Icons.map,
                  //   color: Colors.black,
                  // ),
                  SizedBox(width: 8),
                  Text(
                    'Buscar en Google Maps',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )));
  }

  Future<void> _launchMapsUrl(num lat, num lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchWhatsApp() async {
    final url = Uri.parse('https://wa.me/%2b$whatsappNumber');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch url');
    }
  }

  void showValidImages() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(msgErrorImagenes),
        backgroundColor: Colors.red,
      ),
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

  Widget inputCustomer() {
    return Material(
      elevation: 0.0,
      child: Container(
        margin: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              dense: true,
              visualDensity:
                  VisualDensity(vertical: selectedCustomer == null ? -2 : -4),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: -20),
              trailing: const Icon(Icons.expand_more),
              horizontalTitleGap: 5,
              isThreeLine: selectedCustomer != null,
              title: selectedCustomer == null
                  ? const Text('Buscar tienda o establecimiento',
                      style: AppTheme.subtitles)
                  : Text(
                      '${(selectedCustomer?.fullName ?? '').toUpperCase()} (${selectedCustomer?.id ?? ''})',
                      style: const TextStyle(fontSize: 16)),
              subtitle: selectedCustomer != null
                  ? Text(
                      ('${(selectedCustomer?.address ?? '')} ${(selectedCustomer?.colonyName ?? '')}\n${(selectedCustomer?.municipalityName ?? '').toUpperCase()}, ${(selectedCustomer?.stateName ?? '').toUpperCase()}')
                          .trim(),
                      style: const TextStyle(fontSize: 12))
                  : null,
              onTap: () async {
                final resultCustomer =
                    await showModalBottomSheet<Map<String, dynamic>>(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                      heightFactor: 0.94,
                      child: CustomersComponent(
                        selectedCustomer: selectedCustomer,
                        codemp: colaborador?.codemp,
                        division: colaborador?.division,
                        compania: colaborador?.idcia,
                        sId: colaborador?.sId,
                        sIdEncuesta: oencuesta?.bc_encuestaId,
                      ),
                    );
                  },
                );
                if (resultCustomer != null) {
                  setState(() {
                    selectedCustomer = resultCustomer['customer'];
                    selectedGps = resultCustomer['gps'];
                    isValidCustomer = true;
                  });
                } else {
                  setState(() {
                    selectedCustomer = null;
                    isValidCustomer = false;
                    selectedGps = null;
                  });
                }
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            isValidCustomer
                ? Container()
                : const Text(
                    'Seleccione una tienda.',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
          ],
        ),
      ),
    );
  }

  SizedBox btnSave() {
    return SizedBox(
        width: 600,
        height: 50,
        //height: getProportionatedScreenHeight(50),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ElevatedButton(
                onPressed: isLoadingButton ? null : onSubmit,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
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
                      ))));
  }

  SizedBox btnShare() {
    return SizedBox(
        width: 600,
        height: 50,
        //height: getProportionatedScreenHeight(50),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextButton(
                onPressed: () {
                  if (defaultTargetPlatform == TargetPlatform.iOS ||
                      defaultTargetPlatform == TargetPlatform.android) {
                    Share.share(
                        'Hola, te invito a usar el servicio Flota Vehícular para reportar oportunidades de Coca-Cola 2.5L Retornable\nhttps://wa.me/+$whatsappNumber?text=Auto',
                        subject: 'Invitación Flota Vehícular');
                  } else {
                    _launchUrl();
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                child: const Text(
                  'Invitar a otros Colaboradores',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ))));
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
