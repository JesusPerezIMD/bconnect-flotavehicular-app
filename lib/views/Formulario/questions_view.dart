import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../models/models.dart';

class QuestionsView extends StatefulWidget {
  final List<Catalogos> catalogos;
  final String bc_asignacionvehiculoid;

  QuestionsView({required this.catalogos, required this.bc_asignacionvehiculoid});

  @override
  _QuestionsViewState createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {

  List<bool> switchStates = [false, false, false];

  String? selectedDH; // Variable para almacenar el DH seleccionado
  String? selectedEmpresaNomina; // Variable para almacenar la empresa de nomina 
  String? selectedEmpresaServicios; // Variable para almacenar la empresa donde presta servicios
  String? selectedTipoNomina; // Variable para almacenar el tipo de nómina
  String? selectedDepartamento; // Variable para almacenar el departamento
  String? selectedSucursalNominal; // Variable para almacenar la sucursal nominal
  String? selectedPuestoAsignado; // Variable para almacenar el puesto asignado
  String? selectedSucursalAX;
  String? selectedDepartamentoAX;
  String?  selectedLineaProduccionAX;
  String? selectedAreaAX;
  String? selectedCentroCostosAX;

  // Listas de opciones para cada desplegable
  List<String> dhResponsables = ["Nombre 1", "Nombre 2", "Nombre 3"]; 
  List<String> empresasNomina = ["Empresa 1", "Empresa 2", "Empresa 3"]; 
  List<String> empresasServicios = ["Servicios 1", "Servicios 2", "Servicios 3"]; 
  List<String> tiposNomina = ["Tipo 1", "Tipo 2", "Tipo 3"]; 
  List<String> departamentos = ["Departamento 1", "Departamento 2", "Departamento 3"]; 
  List<String> sucursalesNominales = ["Sucursal 1", "Sucursal 2", "Sucursal 3"]; 
  List<String> puestosAsignados = ["Puesto 1", "Puesto 2", "Puesto 3"];
  List<String> sucursalesAX = ["Puesto 1", "Puesto 2", "Puesto 3"]; 
  List<String> departamentosAX = ["Puesto 1", "Puesto 2", "Puesto 3"]; 
  List<String> lineasProduccionAX = ["Puesto 1", "Puesto 2", "Puesto 3"];
  List<String> areasAX = ["Puesto 1", "Puesto 2", "Puesto 3"]; 
  List<String> centrosCostosAX = ["Puesto 1", "Puesto 2", "Puesto 3"]; 

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Preguntas'),
    ),
    body: ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            style: TextStyle(
          fontSize: 14,
        ),
            "Por este medio autorizo expresamente a BEPENSA, S.A. DE C.V., sus subsidiarias, afiliadas, controladora y demás empresas relacionadas (en lo sucesivo “BEPENSA”), con domicilio en la Calle 60 Diagonal número 493 entre las calles 59 y 61 de la Colonia Parque Industrial Yucatán, Mérida, Yucatán, para usar, mantener, administrar y en general tratar la información proporcionada por el suscrito, como consecuencia de la relación comercial que actualmente existe o pudiera existir con “BEPENSA”; para mayor información del tratamiento y de los derechos que pueden hacer valer, favor de acceder al Aviso de Privacidad Completo en www.bepensa.com o contactar al Departamento Especializado de Datos Personales al correo electrónico siguiente: datospersonales@bepensa.com",
            maxLines: null,
            overflow: TextOverflow.visible,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 0), // Espacio entre el texto y el Switch
          child: Row(
            children: [
              Switch(
                value: switchStates[0],
                onChanged: (bool value) {
                  setState(() {
                    switchStates[0] = value;
                  });
                },
              ),
            ],
          ),
        ),
          CustomDividerComponent(text: null),
          CustomDropdownFormField(
            hintText: "Nombre del DH responsable de la solicitud*",
            value: selectedDH,
            items: (widget.catalogos[0].empresaNominista ?? [])
                .where((empresa) => empresa.bc_nombre != null)
                .map((empresa) => empresa.bc_nombre!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedDH = value;
              });
            },
          ),
          CustomDividerComponent(text: "Datos generales del ejecutivo"),
          CustomDropdownFormField(
            hintText: "Empresa donde nomina",
            value: selectedEmpresaNomina,
            items: (widget.catalogos[0].empresaNominista ?? [])
                .where((empresa) => empresa.bc_nombre != null)
                .map((empresa) => empresa.bc_nombre!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedEmpresaNomina = value;
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "Empresa donde presta servicios",
            value: selectedEmpresaServicios,
            items: (widget.catalogos[0].empresaNominista ?? [])
                .where((empresa) => empresa.bc_nombre != null)
                .map((empresa) => empresa.bc_nombre!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedEmpresaServicios = value;
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "Tipo de Nomina",
            value: selectedTipoNomina,
            items: (widget.catalogos[0].tipoNomina ?? [])
                .where((tipoN) => tipoN.bc_name != null)
                .map((tipoN) => tipoN.bc_name!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedTipoNomina = value;
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "Departamento",
            value: selectedDepartamento,
            items: (widget.catalogos[0].departamento ?? [])
                .where((depa) => depa.bc_name != null)
                .map((depa) => depa.bc_name!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedDepartamento = value;
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "Sucursal Nominal",
            value: selectedSucursalNominal,
            items: (widget.catalogos[0].sucursalNominal ?? [])
                .where((sn) => sn.bc_name != null)
                .map((sn) => sn.bc_name!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedSucursalNominal = value;
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "Puesto Asignado",
            value: selectedPuestoAsignado,
            items: (widget.catalogos[0].puestoAsignado ?? [])
                .where((pa) => pa.bc_name != null)
                .map((pa) => pa.bc_name!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedPuestoAsignado = value;
              });
            },
          ),
          CustomDividerComponent(text: "Contabilidad AX"),
          CustomDropdownFormField(
            hintText: "Sucursal AX",
            value: selectedSucursalAX,
            items:  (widget.catalogos[0].sucursalAX ?? [])
                .where((sucurAX) => sucurAX.bc_name != null)
                .map((sucurAX) => sucurAX.bc_name!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedSucursalAX = value;
              });
            },
          ),

          CustomDropdownFormField(
            hintText: "Departamento AX",
            value: selectedDepartamentoAX,
            items:  (widget.catalogos[0].departamentoAX ?? [])
                .where((depaAX) => depaAX.bc_name != null)
                .map((depaAX) => depaAX.bc_name!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedDepartamentoAX = value;
              });
            },
          ),

          CustomDropdownFormField(
            hintText: "Linea de Producción AX",
            value: selectedLineaProduccionAX,
            items:  (widget.catalogos[0].lineaProduccionAX ?? [])
                .where((lineaAX) => lineaAX.bc_name != null)
                .map((lineaAX) => lineaAX.bc_name!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedLineaProduccionAX = value;
              });
            },
          ),

          CustomDropdownFormField(
            hintText: "Area AX",
            value: selectedAreaAX,
            items:  (widget.catalogos[0].areaAX ?? [])
                .where((arAX) => arAX.bc_name != null)
                .map((arAX) => arAX.bc_name!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedAreaAX = value;
              });
            },
          ),

          CustomDropdownFormField(
            hintText: "Centro de Costos AX",
            value: selectedCentroCostosAX,
            items:  (widget.catalogos[0].centroCostosAX ?? [])
                .where((centroAX) => centroAX.bc_name != null)
                .map((centroAX) => centroAX.bc_name!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCentroCostosAX = value;
              });
            },
          ),

          ],
      ),
    );
  }
}

