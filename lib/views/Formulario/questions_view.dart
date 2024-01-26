import 'package:bconnect_formulario/models/getSolicitud_Response.dart';
import 'package:bconnect_formulario/views/Formulario/info_view.dart';
import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class QuestionsView extends StatefulWidget {
  final List<Catalogos> catalogos;
  final List<getOneSolicitud> encuestasOne;

  QuestionsView({required this.catalogos, required this.encuestasOne});

  @override
  _QuestionsViewState createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {

  List<bool> switchStates = [false, false, false];

  String? selectedDH;
  String? selectedEmpresaNomina;  
  String? selectedEmpresaServicios; 
  String? selectedTipoNomina; 
  String? selectedDepartamento; 
  String? selectedSucursalNominal; 
  String? selectedPuestoAsignado; 
  String? selectedSucursalAX;
  String? selectedDepartamentoAX;
  String? selectedLineaProduccionAX;
  String? selectedAreaAX;
  String? selectedCentroCostosAX;
  String? selectedImporteAsignado;
  String? selectedTopeAsignado;

@override
Widget build(BuildContext context) {
  String appBarTitle = "Preguntas - Sin Folio";

  if (widget.encuestasOne.isNotEmpty) {
    appBarTitle = "Folio: ${widget.encuestasOne[0].bc_folio}";
  }
  return Scaffold(
    appBar: AppBar(
      title: Text(appBarTitle),
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
          CustomDividerComponent(text: "Datos generales del ejecutivo"),
          CustomDropdownFormField(
            hintText: " Empresa donde nomina",
            value: selectedEmpresaNomina,
            items: (widget.catalogos[0].empresaNominista ?? [])
                .where((empresaNomina) => empresaNomina.bc_nombre != null)
                .map((empresaNomina) => empresaNomina.bc_nombre!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedEmpresaNomina = value;
              });
            },
          ),
          CustomDropdownFormField(
            hintText: " Empresa donde presta servicios",
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
            hintText: " Tipo de Nomina",
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
            hintText: " Departamento",
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
            hintText: " Sucursal Nominal",
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
            hintText: " Puesto Asignado",
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
            hintText: " Sucursal AX",
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
            hintText: " Departamento AX",
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
            hintText: " Linea de Producción AX",
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
            hintText: " Area AX",
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
            hintText: " Centro de Costos AX",
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
          CustomDividerComponent(text: "Importe de Monto Asignado"),
          CustomDropdownFormField(
            hintText: " Validar el importe asignado a 3 y 4 años respectivamente",
            value: selectedImporteAsignado,
            items:  (widget.catalogos[0].importeAsignado ?? [])
                .where((importAsignado) => importAsignado.bc_nombre != null)
                .map((importAsignado) => importAsignado.bc_nombre!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedImporteAsignado = value;
              });
            },
          ),
          CustomDropdownFormField(
            hintText: " Validar el tope asignado a 3 y 4 años respectivamente",
            value: selectedTopeAsignado,
            items: (widget.catalogos[0].importeAsignado ?? [])
                .where((importTope) => importTope.bc_nombre != null)
                .map((importTope) => importTope.bc_nombre!)
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedTopeAsignado = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () async {
                  CreateRegistros registros = CreateRegistros(
                    bcVEmpresaNominista: selectedEmpresaNomina, 
                    bcVEmpresaServicios: selectedEmpresaServicios, 
                    // ... Continúa agregando los campos necesarios
                  );
                  try {
                    var response = await BConnectService().createRegistros(registros);
                    // Verifica si la lista encuestasOne tiene elementos antes de acceder
                    if (widget.encuestasOne.isNotEmpty) {
                      var selectedEncuesta = widget.encuestasOne[0];
                      // Navegar a InfoPage si la respuesta es exitosa
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(selectedEncuesta, selectedEncuesta.bc_folio!),
                        ),
                      );
                    } else {
                      // Manejar el caso cuando encuestasOne está vacío
                    }
                  } catch (e) {
                    throw Exception('Error fetching data: $e');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text('Enviar'),
              ),
            ),
          ),

        ],
      ),
    );
  }
}