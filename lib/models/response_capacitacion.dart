class SolicitudCapacitacion {
  String? colorexterior;
  String? colorinterior;
  String? folio;
  String? codemp;
  String? modelo;
  String? plazo;
  String? tipoadquisicion;
  String? vdivision;
  int? statecode;
  DateTime? createdon;
  DateTime? modifiedon;

  SolicitudCapacitacion({
  this.colorexterior,
  this.colorinterior,
  this.folio,
  this.codemp,
  this.modelo,
  this.plazo,
  this.tipoadquisicion,
  this.vdivision,
  this.statecode,
  DateTime? createdon,
  DateTime? modifiedon,
  });
  SolicitudCapacitacion.fromJson(Map<String, dynamic> json) {
    colorexterior = json['bc_colorexterior'];
    colorinterior = json['bc_colorinterior'];
    folio = json['bc_folio'];
    codemp = json['bc_codemp'];
    modelo = json['bc_modelo'];
    plazo = json['bc_plazo'];
    tipoadquisicion = json['bc_tipoadquisicion'];
    vdivision = json['bc_vdivision'];
    statecode = json['statecode'];
    createdon = DateTime.parse(json['createdon']);
    modifiedon = DateTime.parse(json['modifiedon']);
  }
}