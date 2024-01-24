// ignore_for_file: non_constant_identifier_names
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;

class Environment {
  final GOOGLE_MAP_API_KEY = "AIzaSyDedLDHWHo6oEILIO5ycJYsv6dATa-Aaf8";

  //Local
  //final BCONNECT_API = "http://localhost:17330";
  // final UrlApiImages = 'https://localhost:44376/';
  // final TWILIO_API = 'http://localhost:7071/api';
  // final WHATSAPP_NUMBER = "15165185350";

  //Test
  final BCONNECT_API = "https://bconnectapitest.azurewebsites.net";
  final UrlApiImages = 'https://bconnect-aliados-api.azurewebsites.net/';
  final TWILIO_API = 'https://twiliofunctionbconnect.azurewebsites.net/api';
  final WHATSAPP_NUMBER = "15165185350";

  //Production
  // final BCONNECT_API = "https://bconnect-auth-api.azurewebsites.net";
  // final UrlApiImages = 'https://bconnect-aliados-api-prod.azurewebsites.net/';
  // final TWILIO_API = 'https://bconnect-twilio-function.azurewebsites.net/api';
  // final WHATSAPP_NUMBER = "5219993991528";
  
  final DEFAULT_LOCATION = const gm.LatLng(20.968147, -89.629872);
  final SERVICE_ID = "C825c684-99dd-4bba-9cf2-303b239c804B"; 
  final SERVICE_NAME="Flota Vehícular";

  static final Environment _environment = Environment._internal();

  factory Environment() {
    return _environment;
  }

  Environment._internal();
}
