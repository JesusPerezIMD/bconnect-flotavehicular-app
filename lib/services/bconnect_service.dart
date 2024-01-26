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
          solicitudList.add(getSolicitud.fromJson(data));
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
      var response = await http.get(
          Uri.parse(
              "$powerAutomateCreateFlowUrl&bc_asignacionvehiculoid=${registros.bcAsignacionVehiculoId}&bc_importecombustible=${registros.bcImporteCombustible}"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
