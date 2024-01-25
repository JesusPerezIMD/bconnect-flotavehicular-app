import 'dart:convert';
import 'package:bconnect_formulario/env.dart';
import '../../models/models.dart';
import 'package:http/http.dart' as http;
import '../models/response_capacitacion.dart';

class BConnectService {
  String? token;
  String apiUrl = Environment().BCONNECT_API;

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

  Future<List<Customer>> getCustomers(
      String textSearch,
      num longitude,
      num latitude,
      num limit,
      num maxDistance,
      String codemp,
      String division,
      String compania,
      String sId,
      String sIdEncuesta) async {
    try {
      List<Customer> customers = [];
      final response = await http.get(
          Uri.parse(
              '$apiUrl/Capacitacion/Clientes?textoBusqueda=$textSearch&longitud=$longitude&latitud=$latitude&limite=$limit&distanciaMax=$maxDistance&codemp=$codemp&sId=$sId&idEncuesta=$sIdEncuesta&division=$division&compania=$compania'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        for (var data in result) {
          customers.add(Customer.fromJson(data));
        }
      }
      return customers;
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

  Future<List<SolicitudCapacitacion>> getResponse(String codemp,String status) async {
    try {
      List<SolicitudCapacitacion> capacitacion = [];
      final response = await http.get(
          Uri.parse('$apiUrl/Encuestas/getCapacitacion?empCode=$codemp&status=$status'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        for (var data in result) {
          capacitacion.add(SolicitudCapacitacion.fromJson(data));
        }
      }
      return capacitacion;
    } catch (e) {
      throw Exception(e);
    }
  }

}
