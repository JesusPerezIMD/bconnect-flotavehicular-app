class getOneSolicitud {
  String? bc_asignacionvehiculoid;
  String? bc_folio;
  bool? bc_terminossolicitudadquisicion;
  String? bc_terminossolicitudadquisicionname;
  String? bc_vdivision;
  String? bc_vdivisionname;
  String? bc_vcolaborador;
  String? bc_vcolaboradorname;
  String? bc_nombrecolaborador;
  String? bc_codemp;
  String? bc_telefono;
  String? bc_email;
  String? bc_rfc;
  String? bc_curp;
  String? bc_ciudadentrega;
  int? bc_tipoadquisicion;
  String? bc_tipoadquisicionname;
  int? bc_plazo;
  String? bc_plazoname;
  String? bc_vmarca;
  String? bc_vmarcaname;
  String? bc_versiontipo;
  String? bc_colorexterior;
  String? bc_colorinterior;
  String? bc_preciounidad;
  String? bc_diferenciainicial;
  int? bc_formapago;
  String? bc_formapagoname;
  bool? bc_aceptar;
  String? bc_aceptarname;
  bool? bc_terminosasignacionvehiculo;
  String? bc_terminosasignacionvehiculoname;
  String? bc_vdh;
  String? bc_vdhname;
  int? bc_tipoasignacion;
  String? bc_tipoasignacionname;
  String? bc_nombredivision;
  String? bc_vempresanominista;
  String? bc_vempresanoministaname;
  String? bc_vempresaservicios;
  String? bc_vempresaserviciosname;
  String? bc_vtiponomina;
  String? bc_vtiponominaname;
  String? bc_vdepartamento;
  String? bc_vdepartamentoname;
  String? bc_vpuesto;
  String? bc_vpuestoname;
  String? bc_ubicacionfisicaotros;
  String? bc_vdh2;
  String? bc_vdh2name;
  int? bc_importecombustible;
  String? bc_importecombustiblename;
  String? bc_organizacionfilial;
  int? bc_cajasocio;
  String? bc_cajasocioname;
  String? bc_vsucursalax;
  String? bc_vsucursalaxname;
  String? bc_vareaax;
  String? bc_vareaaxname;
  String? bc_vdepartamentoax;
  String? bc_vdepartamentoaxname;
  String? bc_vcentrocostosax;
  String? bc_vcentrocostosaxname;
  String? bc_vlineaproduccionax;
  String? bc_vlineaproduccionaxname;
  bool? bc_imagendatosrequeridos;
  String? bc_imagendatosrequeridosname;
  int? bc_aprobacion;
  String? bc_aprobacionname;
  String? bc_vsucursalnominal;
  String? bc_vsucursalnominalname;
  String? bc_vtopeasignado;
  String? bc_vtopeasignadoname;
  int? bc_ubicacionfisica;
  String? bc_ubicacionfisicaname;
  String? bc_importecombustibleotros;
  String? bc_vimporteasignado;
  String? bc_vimporteasignadoname;
  String? bc_vmodelo;
  String? bc_vmodeloname;
  String? bc_nombres;
  String? bc_apellidos;
  int? bc_facturar;
  String? bc_facturarname;
  int? bc_solicitudestatus;
  String? bc_solicitudestatusname;
  int? bc_solicitudrecibida;
  String? bc_solicitudrecibidaname;
  bool? bc_requisitadaerp;
  String? bc_requisitadaerpname;
  bool? bc_valorizadaerp;
  String? bc_valorizadaerpname;
  bool? bc_procesofondeo;
  String? bc_procesofondeoname;
  bool? bc_procesoautorizaciones;
  String? bc_procesoautorizacionesname;
  bool? bc_autorizada;
  String? bc_autorizadaname;
  bool? bc_ordencompraemitida;
  String? bc_ordencompraemitidaname;
  bool? bc_procesoasignacion;
  String? bc_procesoasignacionname;
  bool? bc_asignadaprocesofacturacion;
  String? bc_asignadaprocesofacturacionname;
  bool? bc_facturarecibida;
  String? bc_facturarecibidaname;
  bool? bc_procesoaltalmcontabilidad;
  String? bc_procesoaltalmcontabilidadname;
  DateTime? createdon;
  DateTime? modifiedon;

  getOneSolicitud({
    this.bc_asignacionvehiculoid,
    this.bc_folio,
    this.bc_terminossolicitudadquisicion,
    this.bc_terminossolicitudadquisicionname,
    this.bc_vdivision,
    this.bc_vdivisionname,
    this.bc_vcolaborador,
    this.bc_vcolaboradorname,
    this.bc_nombrecolaborador,
    this.bc_codemp,
    this.bc_telefono,
    this.bc_email,
    this.bc_rfc,
    this.bc_curp,
    this.bc_ciudadentrega,
    this.bc_tipoadquisicion,
    this.bc_tipoadquisicionname,
    this.bc_plazo,
    this.bc_plazoname,
    this.bc_vmarca,
    this.bc_vmarcaname,
    this.bc_versiontipo,
    this.bc_colorexterior,
    this.bc_colorinterior,
    this.bc_preciounidad,
    this.bc_diferenciainicial,
    this.bc_formapago,
    this.bc_formapagoname,
    this.bc_aceptar,
    this.bc_aceptarname,
    this.bc_terminosasignacionvehiculo,
    this.bc_terminosasignacionvehiculoname,
    this.bc_vdh,
    this.bc_vdhname,
    this.bc_tipoasignacion,
    this.bc_tipoasignacionname,
    this.bc_nombredivision,
    this.bc_vempresanominista,
    this.bc_vempresanoministaname,
    this.bc_vempresaservicios,
    this.bc_vempresaserviciosname,
    this.bc_vtiponomina,
    this.bc_vtiponominaname,
    this.bc_vdepartamento,
    this.bc_vdepartamentoname,
    this.bc_vpuesto,
    this.bc_vpuestoname,
    this.bc_ubicacionfisicaotros,
    this.bc_vdh2,
    this.bc_vdh2name,
    this.bc_importecombustible,
    this.bc_importecombustiblename,
    this.bc_organizacionfilial,
    this.bc_cajasocio,
    this.bc_cajasocioname,
    this.bc_vsucursalax,
    this.bc_vsucursalaxname,
    this.bc_vareaax,
    this.bc_vareaaxname,
    this.bc_vdepartamentoax,
    this.bc_vdepartamentoaxname,
    this.bc_vcentrocostosax,
    this.bc_vcentrocostosaxname,
    this.bc_vlineaproduccionax,
    this.bc_vlineaproduccionaxname,
    this.bc_imagendatosrequeridos,
    this.bc_imagendatosrequeridosname,
    this.bc_aprobacion,
    this.bc_aprobacionname,
    this.bc_vsucursalnominal,
    this.bc_vsucursalnominalname,
    this.bc_vtopeasignado,
    this.bc_vtopeasignadoname,
    this.bc_ubicacionfisica,
    this.bc_ubicacionfisicaname,
    this.bc_importecombustibleotros,
    this.bc_vimporteasignado,
    this.bc_vimporteasignadoname,
    this.bc_vmodelo,
    this.bc_vmodeloname,
    this.bc_nombres,
    this.bc_apellidos,
    this.bc_facturar,
    this.bc_facturarname,
    this.bc_solicitudestatus,
    this.bc_solicitudestatusname,
    this.bc_solicitudrecibida,
    this.bc_solicitudrecibidaname,
    this.bc_requisitadaerp,
    this.bc_requisitadaerpname,
    this.bc_valorizadaerp,
    this.bc_valorizadaerpname,
    this.bc_procesofondeo,
    this.bc_procesofondeoname,
    this.bc_procesoautorizaciones,
    this.bc_procesoautorizacionesname,
    this.bc_autorizada,
    this.bc_autorizadaname,
    this.bc_ordencompraemitida,
    this.bc_ordencompraemitidaname,
    this.bc_procesoasignacion,
    this.bc_procesoasignacionname,
    this.bc_asignadaprocesofacturacion,
    this.bc_asignadaprocesofacturacionname,
    this.bc_facturarecibida,
    this.bc_facturarecibidaname,
    this.bc_procesoaltalmcontabilidad,
    this.bc_procesoaltalmcontabilidadname,
    this.createdon,
    this.modifiedon,
  });

  getOneSolicitud.fromJson(Map<String, dynamic> json) {
    bc_asignacionvehiculoid = json['bc_asignacionvehiculoid'];
    bc_folio = json['bc_folio'];
    bc_terminossolicitudadquisicion = json['bc_terminossolicitudadquisicion'];
    bc_terminossolicitudadquisicionname = json['bc_terminossolicitudadquisicionname'];
    bc_vdivision = json['bc_vdivision'];
    bc_vdivisionname = json['bc_vdivisionname'];
    bc_vcolaborador = json['bc_vcolaborador'];
    bc_vcolaboradorname = json['bc_vcolaboradorname'];
    bc_nombrecolaborador = json['bc_nombrecolaborador'];
    bc_codemp = json['bc_codemp'];
    bc_telefono = json['bc_telefono'];
    bc_email = json['bc_email'];
    bc_rfc = json['bc_rfc'];
    bc_curp = json['bc_curp'];
    bc_ciudadentrega = json['bc_ciudadentrega'];
    bc_tipoadquisicion = json['bc_tipoadquisicion'];
    bc_tipoadquisicionname = json['bc_tipoadquisicionname'];
    bc_plazo = json['bc_plazo'];
    bc_plazoname = json['bc_plazoname'];
    bc_vmarca = json['bc_vmarca'];
    bc_vmarcaname = json['bc_vmarcaname'];
    bc_versiontipo = json['bc_versiontipo'];
    bc_colorexterior = json['bc_colorexterior'];
    bc_colorinterior = json['bc_colorinterior'];
    bc_preciounidad = json['bc_preciounidad'];
    bc_diferenciainicial = json['bc_diferenciainicial'];
    bc_formapago = json['bc_formapago'];
    bc_formapagoname = json['bc_formapagoname'];
    bc_aceptar = json['bc_aceptar'];
    bc_aceptarname = json['bc_aceptarname'];
    bc_terminosasignacionvehiculo = json['bc_terminosasignacionvehiculo'];
    bc_terminosasignacionvehiculoname = json['bc_terminosasignacionvehiculoname'];
    bc_vdh = json['bc_vdh'];
    bc_vdhname = json['bc_vdhname'];
    bc_tipoasignacion = json['bc_tipoasignacion'];
    bc_tipoasignacionname = json['bc_tipoasignacionname'];
    bc_nombredivision = json['bc_nombredivision'];
    bc_vempresanominista = json['bc_vempresanominista'];
    bc_vempresanoministaname = json['bc_vempresanoministaname'];
    bc_vempresaservicios = json['bc_vempresaservicios'];
    bc_vempresaserviciosname = json['bc_vempresaserviciosname'];
    bc_vtiponomina = json['bc_vtiponomina'];
    bc_vtiponominaname = json['bc_vtiponominaname'];
    bc_vdepartamento = json['bc_vdepartamento'];
    bc_vdepartamentoname = json['bc_vdepartamentoname'];
    bc_vpuesto = json['bc_vpuesto'];
    bc_vpuestoname = json['bc_vpuestoname'];
    bc_ubicacionfisicaotros = json['bc_ubicacionfisicaotros'];
    bc_vdh2 = json['bc_vdh2'];
    bc_vdh2name = json['bc_vdh2name'];
    bc_importecombustible = json['bc_importecombustible'];
    bc_importecombustiblename = json['bc_importecombustiblename'];
    bc_organizacionfilial = json['bc_organizacionfilial'];
    bc_cajasocio = json['bc_cajasocio'];
    bc_cajasocioname = json['bc_cajasocioname'];
    bc_vsucursalax = json['bc_vsucursalax'];
    bc_vsucursalaxname = json['bc_vsucursalaxname'];
    bc_vareaax = json['bc_vareaax'];
    bc_vareaaxname = json['bc_vareaaxname'];
    bc_vdepartamentoax = json['bc_vdepartamentoax'];
    bc_vdepartamentoaxname = json['bc_vdepartamentoaxname'];
    bc_vcentrocostosax = json['bc_vcentrocostosax'];
    bc_vcentrocostosaxname = json['bc_vcentrocostosaxname'];
    bc_vlineaproduccionax = json['bc_vlineaproduccionax'];
    bc_vlineaproduccionaxname = json['bc_vlineaproduccionaxname'];
    bc_imagendatosrequeridos = json['bc_imagendatosrequeridos'];
    bc_imagendatosrequeridosname = json['bc_imagendatosrequeridosname'];
    bc_aprobacion = json['bc_aprobacion'];
    bc_aprobacionname = json['bc_aprobacionname'];
    bc_vsucursalnominal = json['bc_vsucursalnominal'];
    bc_vsucursalnominalname = json['bc_vsucursalnominalname'];
    bc_vtopeasignado = json['bc_vtopeasignado'];
    bc_vtopeasignadoname = json['bc_vtopeasignadoname'];
    bc_ubicacionfisica = json['bc_ubicacionfisica'];
    bc_ubicacionfisicaname = json['bc_ubicacionfisicaname'];
    bc_importecombustibleotros = json['bc_importecombustibleotros'];
    bc_vimporteasignado = json['bc_vimporteasignado'];
    bc_vimporteasignadoname = json['bc_vimporteasignadoname'];
    bc_vmodelo = json['bc_vmodelo'];
    bc_vmodeloname = json['bc_vmodeloname'];
    bc_nombres = json['bc_nombres'];
    bc_apellidos = json['bc_apellidos'];
    bc_facturar = json['bc_facturar'];
    bc_facturarname = json['bc_facturarname'];
    bc_solicitudestatus = json['bc_solicitudestatus'];
    bc_solicitudestatusname = json['bc_solicitudestatusname'];
    bc_solicitudrecibida = json['bc_solicitudrecibida'];
    bc_solicitudrecibidaname = json['bc_solicitudrecibidaname'];
    bc_requisitadaerp = json['bc_requisitadaerp'];
    bc_requisitadaerpname = json['bc_requisitadaerpname'];
    bc_valorizadaerp = json['bc_valorizadaerp'];
    bc_valorizadaerpname = json['bc_valorizadaerpname'];
    bc_procesofondeo = json['bc_procesofondeo'];
    bc_procesofondeoname = json['bc_procesofondeoname'];
    bc_procesoautorizaciones = json['bc_procesoautorizaciones'];
    bc_procesoautorizacionesname = json['bc_procesoautorizacionesname'];
    bc_autorizada = json['bc_autorizada'];
    bc_autorizadaname = json['bc_autorizadaname'];
    bc_ordencompraemitida = json['bc_ordencompraemitida'];
    bc_ordencompraemitidaname = json['bc_ordencompraemitidaname'];
    bc_procesoasignacion = json['bc_procesoasignacion'];
    bc_procesoasignacionname = json['bc_procesoasignacionname'];
    bc_asignadaprocesofacturacion = json['bc_asignadaprocesofacturacion'];
    bc_asignadaprocesofacturacionname = json['bc_asignadaprocesofacturacionname'];
    bc_facturarecibida = json['bc_facturarecibida'];
    bc_facturarecibidaname = json['bc_facturarecibidaname'];
    bc_procesoaltalmcontabilidad = json['bc_procesoaltalmcontabilidad'];
    bc_procesoaltalmcontabilidadname = json['bc_procesoaltalmcontabilidadname'];
    createdon = json['createdon'] != null ? DateTime.parse(json['createdon']) : null;
    modifiedon = json['modifiedon'] != null ? DateTime.parse(json['modifiedon']) : null; 
  }
}
