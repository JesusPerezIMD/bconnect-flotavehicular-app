import 'dart:convert';
import 'dart:html';
import 'package:bconnect_formulario/env.dart';
import 'package:bconnect_formulario/models/getSolicitud_Response.dart';
import '../../models/models.dart';
import 'package:http/http.dart' as http;

class BConnectService {
  String? token;
  String apiUrl = Environment().BCONNECT_API;
  String powerAutomateCreateFlowUrl =
      Environment().CREATE_POWER_AUTOMATE_FLOW;

  BConnectService();

  Future<AuthUser?> authByAccessToken(String token) async {
    try {
      AuthUser? user;
      final response = await http.post(
          Uri.parse('$apiUrl/Auth/AuthByAccessToken'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode(<String, String>{
            'access_token': token,
            'servicesId': Environment().SERVICE_ID
          }));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        user = AuthUser.fromJson(result);
      }
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AuthUserCode?> authByAccessCode(String code) async {
    try {
      AuthUserCode? userCode;
      final response = await http.post(Uri.parse('$apiUrl/Auth/AccessCode'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode(<String, String>{
            'accessCode': code,
            'servicesId': Environment().SERVICE_ID
          }));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        userCode = AuthUserCode.fromJson(result);
      }
      return userCode;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<BCColaborador?> getColaborador(String userId) async {
    try {
      BCColaborador? colaborador;
      final response = await http.get(
        Uri.parse('$apiUrl/Hub/Profiles/ColaboradorByUserId?userId=$userId'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        colaborador = BCColaborador.fromJson(result);
      }
      return colaborador;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<BCUser?> chechAccessToken(String token) async {
    try {
      BCUser? user;
      final response =
          await http.get(Uri.parse('$apiUrl/Auth/CheckAccessToken'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        user = BCUser.fromJson(result);
      }
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<FirebaseUser?> firebaseAuth(String token) async {
    try {
      FirebaseUser? firebaseUser;
      final response =
          await http.get(Uri.parse('$apiUrl/Auth/AuthUser'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        firebaseUser = FirebaseUser.fromJson(result);
      }
      return firebaseUser;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<getSolicitud>> getForms(String userid) async {
    try {
      List<getSolicitud> solicitudList = [];
      final response = await http.get(
          Uri.parse('$apiUrl/FlotaVehicular/getSolicitud?empCode=$userid'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) {
        final List<dynamic> result = jsonDecode(response.body);
        for (var data in result) {
          getSolicitud solicitud = getSolicitud.fromJson(data);
          
          // Aquí agregamos una condición para filtrar los resultados
          if (solicitud.bc_terminosasignacionvehiculo == false) {
            solicitudList.add(solicitud);
          }
        }
      }
      return solicitudList;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<getSolicitud>> getFormsHistory(String userid) async {
    try {
      List<getSolicitud> solicitudList = [];
      final response = await http.get(
          Uri.parse('$apiUrl/FlotaVehicular/getSolicitud?empCode=$userid'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) {
        final List<dynamic> result = jsonDecode(response.body);
        for (var data in result) {
          getSolicitud solicitud = getSolicitud.fromJson(data);
          
          // Aquí agregamos una condición para filtrar los resultados
          if (solicitud.bc_terminosasignacionvehiculo == true) {
            solicitudList.add(solicitud);
          }
        }
      }
      return solicitudList;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<getOneSolicitud>> getOneForms(String id) async {
    try {
      List<getOneSolicitud> solicitudOneList = [];
      final response = await http.get(
          Uri.parse('$apiUrl/FlotaVehicular/getOneSolicitud?id=$id'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) {
        final List<dynamic> result = jsonDecode(response.body);
        for (var data in result) {
          solicitudOneList.add(getOneSolicitud.fromJson(data));
        }
      }
      return solicitudOneList;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Catalogos> getCatalogos(String divisionId) async {
    try {
      final response = await http.get(
          Uri.parse('$apiUrl/FlotaVehicular/getCatalogos?divisionId=$divisionId'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Catalogos.fromJson(data);
      } else {
        // Manejo de errores de respuesta no exitosa
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Manejo de otros tipos de errores
      throw Exception('Error fetching data: $e');
    }
  }

  Future<String> createRegistros(CreateRegistros registros) async {
    try {
      var body = jsonEncode({
        'bc_asignacionvehiculoid': registros.bcAsignacionVehiculoId ?? "",
        'bc_terminosasignacionvehiculo': registros.bcTerminosAsignacionVehiculo?.toString() ?? "0",
        'bc_vdh': registros.bcVdh ?? "",
        'bc_imagendatosrequeridos': registros.bcImagenDatosRequeridos?.toString() ?? "0",
        'bc_vempresanominista': registros.bcVEmpresaNominista ?? "",
        'bc_empresanoministaotras': registros.bcEmpresaNoministaOtras ?? "",
        'bc_vempresaservicios': registros.bcVEmpresaServicios ?? "",
        'bc_empresaserviciosotras': registros.bcEmpresaServiciosOtras ?? "",
        'bc_vtiponomina': registros.bcVTipoNomina ?? "",
        'bc_tiponominaotras': registros.bcTipoNominaOtras ?? "",
        'bc_vdepartamento': registros.bcVDepartamento ?? "",
        'bc_departamentootras': registros.bcDepartamentoOtras ?? "",
        'bc_vsucursalnominal': registros.bcVSucursalNominal ?? "",
        'bc_sucursalnominalotras': registros.bcSucursalNominalOtras ?? "",
        'bc_vpuesto': registros.bcVPuesto ?? "",
        'bc_puestootras': registros.bcPuestoOtras ?? "",
        'bc_ubicacionfisica': registros.bcUbicacionFisica?.toString() ?? "0",
        'bc_ubicacionfisicaotras': registros.bcUbicacionFisicaOtras ?? "",
        'bc_ubicacionfisicaotros': registros.bcUbicacionFisicaOtros ?? "",
        'bc_vdh2': registros.bcVdh2 ?? "",
        'bc_organizacionfilial': registros.bcOrganizacionFilial ?? "",
        'bc_cajasocio': registros.bcCajaSocio?.toString() ?? "0",
        'bc_importecombustible': registros.bcImporteCombustible?.toString() ?? "0",
        'bc_importecombustibleotras': registros.bcImporteCombustibleOtras ?? "",
        'bc_importecombustibleotros': registros.bcImporteCombustibleOtros ?? "",
        'bc_vsucursalax': registros.bcVSucursalAx ?? "",
        'bc_sucursalaxotras': registros.bcSucursalAxOtras ?? "",
        'bc_vareaax': registros.bcVAreaAx ?? "",
        'bc_vdepartamentoax': registros.bcVDepartamentoAx ?? "",
        'bc_departamentoaxotras': registros.bcDepartamentoAxOtras ?? "",
        'bc_areaaxotras': registros.bcAreaAxOtras ?? "",
        'bc_vcentrocostosax': registros.bcVCentroCostosAx ?? "",
        'bc_centrocostosaxotras': registros.bcCentroCostosAxOtras ?? "",
        'bc_lineaproduccionaxotras': registros.bcLineaProduccionAxOtras ?? "",
        'bc_vlineaproduccionax': registros.bcVLineaProduccionAx ?? "",
        'bc_vimporteasignado': registros.bcVImporteAsignado ?? "",
        'bc_vtopeasignado': registros.bcVTopeAsignado ?? "",
      });

      // Imprimir el cuerpo de la solicitud
      print(body);

      var response = await http.post(
        Uri.parse(powerAutomateCreateFlowUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: body,
      );

      if (response.statusCode == 202) {
        return response.body;
      } else {
        throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
