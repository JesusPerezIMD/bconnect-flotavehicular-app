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
import '../../models/response_capacitaciondnc.dart';
import '../../models/response_capacitacion.dart';
import '../../services/bconnect_service.dart';

class HistorialCapacitacionPage extends StatefulWidget {
  final SolicitudCapacitacion? responsecapacitacion;
  const HistorialCapacitacionPage({Key? key, this.responsecapacitacion})
      : super(key: key);
  @override
  State<HistorialCapacitacionPage> createState() =>
      _HistorialCapacitacionPageState();
}

class _HistorialCapacitacionPageState extends State<HistorialCapacitacionPage> {
  List<SolicitudCapacitacion> listResponse = [];
  final _formKey = GlobalKey<FormState>();
  BCUser? user;
  FirebaseUser? firebaseUser;
  BCColaborador? colaborador;
  bool loadingReports = true;

  String nameCapacitacion="";
  final formatCurrency =
      NumberFormat.currency(locale: 'es_MX', symbol: '', decimalDigits: 2);
  String selectedEstatus = 'Todos';
  
  
  Capacitacion? oencuesta;
  List<Capacitacion> encuestas = [];
  String? userid = '';
  String serviceName=Environment().SERVICE_NAME;
  String codemp ='';

  Future<void> getResponse(String codemp,String status) async {
    var result = await BConnectService().getResponse(codemp,status);
    if (mounted) {
      setState(() {
        listResponse = result;
        loadingReports = false;
      });
    }
  }

  Future<void> getForms(String division) async {
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
    super.initState();
    Future.delayed(Duration.zero, () async {
      await initUser(context);
      codemp = colaborador!.codemp!;
      userid = user?.sId!;
      await getForms(userid!);

      if (oencuesta == null) {
        if (mounted) {
          setState(() {
            loadingReports = false;
          });
        }
        return;
      }
      await getResponse(codemp, selectedEstatus);
      if (mounted) {
        setState(() {
          loadingReports = false;
        });
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
    List<Widget> listaCapacitaciones = listReports();

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
      body: loadingReports
          ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              itemCount: listaCapacitaciones.length + 1, // +1 por el widget de filtro
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: filtros());
                }
                return listaCapacitaciones[index - 1];
              },
            ),
    );
  }

  List<Widget> listReports() {
    if (listResponse.isEmpty) {
      return [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'No tienes Solicitudes registradas',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ];
    } else {
      return  listTodayReports();
    }
  }

   List<Widget> listTodayReports() {
    List<Widget> list = [];
    var reports = listResponse.where((report) => DateUtils.isSameDay(
        DateTime.now().toUtc(), (report.createdon ?? DateTime.now())));
    if (reports.isNotEmpty) {
      list.add(Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Text(
          'Reportes del día',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ));
      list.addAll(reports.map((report) => Column(
            children: <Widget>[
              ListTile(
                contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                leading: SizedBox(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green[300],
                        radius: 14,
                        child: const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 18,
                              ),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                     Text(
                        getDateLocal(report.createdon ?? DateTime.now()),
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text(
                        getTimeLocal(report.createdon ?? DateTime.now()),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                title: Text('${report.folio ?? ''} (${report.modelo})'),
                subtitle: Text('Encuesta: ${report.plazo}'
                    '  División: ${report.vdivision}'),
                isThreeLine: true,
              ),
              const Divider(height: 0),
            ],
          )));
    }
    return list;
  }

  String getDateLocal(DateTime utc) {
    return DateFormat('dd/MM/yyyy', 'es').format(
        DateFormat('yyyy-MM-dd HH:mm:ss')
            .parse(utc.toString(), true)
            .toLocal());
  }

  String getTimeLocal(DateTime utc) {
    return DateFormat('h:mm a', 'es').format(DateFormat('yyyy-MM-dd HH:mm:ss')
        .parse(utc.toString(), true)
        .toLocal());
  }

  Form filtros() {
    return Form(
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
          Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ddlEncuestas()
          ),
    ]));
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
              child: Text(item.bc_nombre.toString()),
            );
          }).toList()
        : [const DropdownMenuItem(
            value: "NoData",
            child: Text("No existen datos"),
          )],
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
}
