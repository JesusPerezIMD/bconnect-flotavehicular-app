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

  String? divisionName;
  int? selectedTerminosAsignacion = 0;
  String? selectedDH;
  String? selectedEmpresaNomina;  
  String? selectedEmpresaServicios; 
  String? selectedTipoNomina; 
  String? selectedDepartamento; 
  String? selectedSucursalNominal; 
  String? selectedPuestoAsignado;
  String? selectedChoiceUbicacionFisica;
  String? textUbicacionFisica = "";
  String? textOrganizacionFilial = "";
  String? selectedChoiceCajaSocio;
  String? selectedChoiceImporteCombustible;
  String? textImporteCombustible = "";
  String? selectedSucursalAX;
  String? selectedAreaAX;
  String? selectedDepartamentoAX;
  String? selectedCentroCostosAX;
  String? selectedLineaProduccionAX;
  String? selectedImporteAsignado;
  String? selectedTopeAsignado;

  @override
  void initState() {
    super.initState();
    if (widget.encuestasOne.isNotEmpty) {
      divisionName = widget.encuestasOne[0].bc_vdivisionname;
    }
  }


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
              value: selectedTerminosAsignacion == 1,
              onChanged: (bool value) {
                setState(() {
                  selectedTerminosAsignacion = value ? 1 : 0;
                });
              },
            ),
            ],
          ),
        ),
        CustomDividerComponent(text: null),
        CustomDropdownFormField<String>(
            hintText: "  Nombre del DH responsable",
            value: selectedDH,
            items: (widget.catalogos[0].dhs ?? [])
                .where((dh) => dh.bc_name != null && dh.bc_vdhid!= null)
                .map((dh) => DropdownItem<String>(
                      value: dh.bc_vdhid!, // El ID de la empresa
                      label: dh.bc_name!, // El nombre de la empresa
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedDH = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
        CustomDividerComponent(text: "Datos generales del ejecutivo"),
          CustomDropdownFormField<String>(
            hintText: "  Empresa donde nomina",
            value: selectedEmpresaNomina,
            items: (widget.catalogos[0].empresaNominista ?? [])
                .where((empresaNomina) => empresaNomina.bc_nombre != null && empresaNomina.bc_vempresanoministaid != null)
                .map((empresaNomina) => DropdownItem<String>(
                      value: empresaNomina.bc_vempresanoministaid!, // El ID de la empresa
                      label: empresaNomina.bc_nombre!, // El nombre de la empresa
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedEmpresaNomina = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Empresa donde presta servicios",
            value: selectedEmpresaServicios,
            items: (widget.catalogos[0].empresaNominista ?? [])
                .where((empresaServicios) => empresaServicios.bc_nombre != null && empresaServicios.bc_vempresanoministaid != null)
                .map((empresaServicios) => DropdownItem<String>(
                      value: empresaServicios.bc_vempresanoministaid!, // El ID de la empresa
                      label: empresaServicios.bc_nombre!, // El nombre de la empresa
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedEmpresaServicios = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Tipo de Nomina",
            value: selectedTipoNomina,
            items: (widget.catalogos[0].tipoNomina ?? [])
                .where((tipoNomina) => tipoNomina.bc_name != null && tipoNomina.bc_vtiponominaid != null)
                .map((tipoNomina) => DropdownItem<String>(
                      value: tipoNomina.bc_vtiponominaid!, // El ID del tipo de nómina
                      label: tipoNomina.bc_name!, // El nombre del tipo de nómina
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedTipoNomina = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Departamento",
            value: selectedDepartamento,
            items: (widget.catalogos[0].departamento ?? [])
                .where((departamento) => departamento.bc_name != null && departamento.bc_vdepartamentoid != null)
                .map((departamento) => DropdownItem<String>(
                      value: departamento.bc_vdepartamentoid!, // El ID del departamento
                      label: departamento.bc_name!, // El nombre del departamento
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedDepartamento = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Sucursal Nominal",
            value: selectedSucursalNominal,
            items: (widget.catalogos[0].sucursalNominal ?? [])
                .where((sucursalNominal) => sucursalNominal.bc_name != null && sucursalNominal.bc_vsucursalnominalid != null)
                .map((sucursalNominal) => DropdownItem<String>(
                      value: sucursalNominal.bc_vsucursalnominalid!, // El ID de la sucursal nominal
                      label: sucursalNominal.bc_name!, // El nombre de la sucursal nominal
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedSucursalNominal = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Puesto Asignado",
            value: selectedPuestoAsignado,
            items: (widget.catalogos[0].puestoAsignado ?? [])
                .where((puestoAsignado) => puestoAsignado.bc_name != null && puestoAsignado.bc_vpuestoid != null)
                .map((puestoAsignado) => DropdownItem<String>(
                      value: puestoAsignado.bc_vpuestoid!, // El ID del puesto asignado
                      label: puestoAsignado.bc_name!, // El nombre del puesto asignado
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedPuestoAsignado = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Ubicación Física",
            value: selectedChoiceUbicacionFisica,
            items: (widget.catalogos[0].choices ?? [])
                .where((ubiFisicaId) => ubiFisicaId.columnname == "bc_ubicacionfisica") // Filtrar por "bc_ubicacionfisica"
                .map((ubiFisicaId) => DropdownItem<String>(
                      value: ubiFisicaId.choicevalue!, // Usar "choicevalue" como valor
                      label: ubiFisicaId.choicename!, // Usar "choicename" como etiqueta
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedChoiceUbicacionFisica = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(6), // Ajusta el valor para cambiar el espacio
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Ubicación Física',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  textUbicacionFisica = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6), // Ajusta el valor para cambiar el espacio
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Organización (Filial-Sucursal-Depto)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  textOrganizacionFilial = value;
                });
              },
            ),
          ),
          CustomDropdownFormField(
            hintText: "  Valide la caja a la cual pertenece el Socio",
            value: selectedChoiceCajaSocio,
            items: (widget.catalogos[0].choices ?? [])
                .where((cajaSocio) => cajaSocio.columnname == "bc_cajasocio") // Filtrar por "bc_ubicacionfisica"
                .map((cajaSocio) => DropdownItem<String>(
                      value: cajaSocio.choicevalue!, // Usar "choicevalue" como valor
                      label: cajaSocio.choicename!, // Usar "choicename" como etiqueta
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedChoiceCajaSocio = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Importe Combustible",
            value: selectedChoiceImporteCombustible,
            items: (widget.catalogos[0].choices ?? [])
                .where((ImportCombustible) => ImportCombustible.columnname == "bc_importecombustible") // Filtrar por "bc_ubicacionfisica"
                .map((ImportCombustible) => DropdownItem<String>(
                      value: ImportCombustible.choicevalue!, // Usar "choicevalue" como valor
                      label: ImportCombustible.choicename!, // Usar "choicename" como etiqueta
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedChoiceImporteCombustible = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(6), // Ajusta el valor para cambiar el espacio
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Importe Combustible',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  textImporteCombustible = value;
                });
              },
            ),
          ),
          CustomDividerComponent(text: "Contabilidad AX"),
          CustomDropdownFormField(
            hintText: "  Sucursal AX",
            value: selectedSucursalAX,
            items: (widget.catalogos[0].sucursalAX ?? [])
                .where((sucursalAX) => sucursalAX.bc_name != null && sucursalAX.bc_vsucursalaxid != null)
                .map((sucursalAX) => DropdownItem<String>(
                      value: sucursalAX.bc_vsucursalaxid!, // El ID de la sucursal AX
                      label: sucursalAX.bc_name!, // El nombre de la sucursal AX
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedSucursalAX = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Departamento AX",
            value: selectedDepartamentoAX,
            items: (widget.catalogos[0].departamentoAX ?? [])
                .where((departamentoAX) => departamentoAX.bc_name != null && departamentoAX.bc_vdepartamentoaxid != null)
                .map((departamentoAX) => DropdownItem<String>(
                      value: departamentoAX.bc_vdepartamentoaxid!, // El ID del departamento AX
                      label: departamentoAX.bc_name!, // El nombre del departamento AX
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedDepartamentoAX = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Linea de Producción AX",
            value: selectedLineaProduccionAX,
            items: (widget.catalogos[0].lineaProduccionAX ?? [])
                .where((lineaProduccionAX) => lineaProduccionAX.bc_name != null && lineaProduccionAX.bc_vlineaproduccionaxid != null)
                .map((lineaProduccionAX) => DropdownItem<String>(
                      value: lineaProduccionAX.bc_vlineaproduccionaxid!, // El ID de la línea de producción AX
                      label: lineaProduccionAX.bc_name!, // El nombre de la línea de producción AX
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedLineaProduccionAX = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Area AX",
            value: selectedAreaAX,
            items: (widget.catalogos[0].areaAX ?? [])
                .where((areaAX) => areaAX.bc_name != null && areaAX.bc_vareaaxid != null)
                .map((areaAX) => DropdownItem<String>(
                      value: areaAX.bc_vareaaxid!, // El ID del área AX
                      label: areaAX.bc_name!, // El nombre del área AX
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedAreaAX = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Centro de Costos AX",
            value: selectedCentroCostosAX,
            items: (widget.catalogos[0].centroCostosAX ?? [])
                .where((centroCostosAX) => centroCostosAX.bc_name != null && centroCostosAX.bc_vcentrocostosaxid != null)
                .map((centroCostosAX) => DropdownItem<String>(
                      value: centroCostosAX.bc_vcentrocostosaxid!, // El ID del centro de costos AX
                      label: centroCostosAX.bc_name!, // El nombre del centro de costos AX
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedCentroCostosAX = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDividerComponent(text: "Importe de Monto Asignado"),
          CustomDropdownFormField(
            hintText: "  Validar el importe asignado a 3 y 4 años respectivamente",
            value: selectedImporteAsignado,
            items: (widget.catalogos[0].importeAsignado ?? [])
                .where((importeAsignado) => importeAsignado.bc_nombre != null && importeAsignado.bc_vimporteasignadoid != null)
                .map((importeAsignado) => DropdownItem<String>(
                      value: importeAsignado.bc_vimporteasignadoid!, // El ID del importe asignado
                      label: importeAsignado.bc_nombre!, // El nombre del importe asignado
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedImporteAsignado = value; // Aquí `value` será el ID seleccionado
              });
            },
          ),
          CustomDropdownFormField(
            hintText: "  Validar el tope asignado a 3 y 4 años respectivamente",
            value: selectedTopeAsignado,
            items: (widget.catalogos[0].importeAsignado ?? [])
                .where((topeAsignado) => topeAsignado.bc_nombre != null && topeAsignado.bc_vimporteasignadoid != null)
                .map((topeAsignado) => DropdownItem<String>(
                      value: topeAsignado.bc_vimporteasignadoid!, // El ID del importe asignado
                      label: topeAsignado.bc_nombre!, // El nombre del importe asignado
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                selectedTopeAsignado = value; // Aquí `value` será el ID seleccionado
              });
            },
          ), 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () async {
                  if (widget.encuestasOne.isNotEmpty) {
                    var selectedEncuesta = widget.encuestasOne[0];
                    CreateRegistros registros = CreateRegistros(
                      bcAsignacionVehiculoId: selectedEncuesta.bc_asignacionvehiculoid,
                      bcTerminosAsignacionVehiculo: selectedTerminosAsignacion,
                      bcVdh: selectedDH,
                      bcVdh2: selectedDH,
                      bcVEmpresaNominista: selectedEmpresaNomina,
                      bcVEmpresaServicios: selectedEmpresaServicios,
                      bcVTipoNomina: selectedTipoNomina,
                      bcVDepartamento: selectedDepartamento,
                      bcVSucursalNominal: selectedSucursalNominal,
                      bcVPuesto: selectedPuestoAsignado,
                      bcUbicacionFisica: selectedChoiceUbicacionFisica,
                      bcUbicacionFisicaOtros: textUbicacionFisica,
                      bcOrganizacionFilial: textOrganizacionFilial,
                      bcCajaSocio: selectedChoiceCajaSocio,
                      bcImporteCombustible: selectedChoiceImporteCombustible,
                      bcImporteCombustibleOtros: textImporteCombustible,
                      bcVSucursalAx: selectedSucursalAX,
                      bcVAreaAx: selectedAreaAX,
                      bcVDepartamentoAx: selectedDepartamentoAX,
                      bcVCentroCostosAx: selectedCentroCostosAX,
                      bcVLineaProduccionAx: selectedLineaProduccionAX,
                      bcVImporteAsignado: selectedImporteAsignado,
                      bcVTopeAsignado: selectedTopeAsignado,
                      
                    );

                    try {
                      var response = await BConnectService().createRegistros(registros);
                      // Navegar a InfoPage si la respuesta es exitosa
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(selectedEncuesta, selectedEncuesta.bc_folio!),
                        ),
                      );
                    } catch (e) {
                      print('Error al crear registros: $e'); // Agrega este print para ver el mensaje de error en la consola.
                    }

                  } else {
                    // Manejar el caso cuando encuestasOne está vacío
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