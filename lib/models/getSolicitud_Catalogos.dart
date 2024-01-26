class DivisionFlota {
  String? bc_nombre;
  String? bc_codigo;
  String? bc_vdivisionid;

  DivisionFlota({
    this.bc_nombre,
    this.bc_codigo,
    this.bc_vdivisionid,
  });

  DivisionFlota.fromJson(Map<String, dynamic> json) {
    bc_nombre = json['bc_nombre'];
    bc_codigo = json['bc_codigo'];
    bc_vdivisionid = json['bc_vdivisionid'];
  }
}

class EmpresaNominista {
  String? bc_nombre;
  String? bc_codigo;
  int? bc_vdivision;
  int? bc_vdivisionname;
  String? bc_vempresanoministaid;

  EmpresaNominista({
    this.bc_nombre,
    this.bc_codigo,
    this.bc_vdivision,
    this.bc_vdivisionname,
    this.bc_vempresanoministaid,
  });

  EmpresaNominista.fromJson(Map<String, dynamic> json) {
    bc_nombre = json['bc_nombre'];
    bc_codigo = json['bc_codigo'];
    bc_vdivision = json['bc_vdivision'];
    bc_vdivisionname = json['bc_vdivisionname'];
    bc_vempresanoministaid = json['bc_vempresanoministaid'];
  }
}

class TipoNomina {
  String? bc_codigo;
  String? bc_name;
  String? bc_nombre;
  String? bc_division;
  String? bc_vdivision;
  String? bc_vdivisionname;
  String? bc_vtiponominaid;

  TipoNomina({
    this.bc_codigo,
    this.bc_name,
    this.bc_nombre,
    this.bc_division,
    this.bc_vdivision,
    this.bc_vdivisionname,
    this.bc_vtiponominaid,
  });

  TipoNomina.fromJson(Map<String, dynamic> json) {
    bc_codigo = json['bc_codigo'];
    bc_name = json['bc_name'];
    bc_nombre = json['bc_nombre'];
    bc_division = json['bc_division'];
    bc_vdivision = json['bc_vdivision'];
    bc_vdivisionname = json['bc_vdivisionname'];
    bc_vtiponominaid = json['bc_vtiponominaid'];
  }
}

class Departamento {
  String? bc_codigo;
  String? bc_name;
  String? bc_nombre;
  String? bc_division;
  String? bc_vdepartamentoid;

  Departamento({
    this.bc_codigo,
    this.bc_name,
    this.bc_nombre,
    this.bc_division,
    this.bc_vdepartamentoid,
  });

  Departamento.fromJson(Map<String, dynamic> json) {
    bc_codigo = json['bc_codigo'];
    bc_name = json['bc_name'];
    bc_nombre = json['bc_nombre'];
    bc_division = json['bc_division'];
    bc_vdepartamentoid = json['bc_vdepartamentoid'];
  }
}

class SucursalNominal {
  String? bc_codigo;
  String? bc_name;
  String? bc_nombre;
  String? bc_vdivision;
  String? bc_vsucursalnominalid;

  SucursalNominal({
    this.bc_codigo,
    this.bc_name,
    this.bc_nombre,
    this.bc_vdivision,
    this.bc_vsucursalnominalid,
  });

  SucursalNominal.fromJson(Map<String, dynamic> json) {
    bc_codigo = json['bc_codigo'];
    bc_name = json['bc_name'];
    bc_nombre = json['bc_nombre'];
    bc_vdivision = json['bc_vdivision'];
    bc_vsucursalnominalid = json['bc_vsucursalnominalid'];
  }
}

class PuestoAsignado {
  String? bc_codigo;
  String? bc_name;
  String? bc_nombre;
  String? bc_vdivision;
  String? bc_vpuestoid;

  PuestoAsignado({
    this.bc_codigo,
    this.bc_name,
    this.bc_nombre,
    this.bc_vdivision,
    this.bc_vpuestoid,
  });

  PuestoAsignado.fromJson(Map<String, dynamic> json) {
    bc_codigo = json['bc_codigo'];
    bc_name = json['bc_name'];
    bc_nombre = json['bc_nombre'];
    bc_vdivision = json['bc_vdivision'];
    bc_vpuestoid = json['bc_vpuestoid'];
  }
}

class ImporteAsignado {
  String? bc_nombre;
  String? bc_vimporteasignadoid;

  ImporteAsignado({
    this.bc_nombre,
    this.bc_vimporteasignadoid,
  });

  ImporteAsignado.fromJson(Map<String, dynamic> json) {
    bc_nombre = json['bc_nombre'];
    bc_vimporteasignadoid = json['bc_vimporteasignadoid'];
  }
}

class SucursalAX {
  String? bc_codigo;
  String? bc_name;
  String? bc_nombre;
  String? bc_vdivision;
  String? bc_vsucursalaxid;

  SucursalAX({
    this.bc_codigo,
    this.bc_name,
    this.bc_nombre,
    this.bc_vdivision,
    this.bc_vsucursalaxid,
  });

  SucursalAX.fromJson(Map<String, dynamic> json) {
    bc_codigo = json['bc_codigo'];
    bc_name = json['bc_name'];
    bc_nombre = json['bc_nombre'];
    bc_vdivision = json['bc_vdivision'];
    bc_vsucursalaxid = json['bc_vsucursalaxid'];
  }
}

class AreaAX {
  String? bc_codigo;
  String? bc_name;
  String? bc_nombre;
  String? bc_vdivision;
  String? bc_vareaaxid;

  AreaAX({
    this.bc_codigo,
    this.bc_name,
    this.bc_nombre,
    this.bc_vdivision,
    this.bc_vareaaxid,
  });

  AreaAX.fromJson(Map<String, dynamic> json) {
    bc_codigo = json['bc_codigo'];
    bc_name = json['bc_name'];
    bc_nombre = json['bc_nombre'];
    bc_vdivision = json['bc_vdivision'];
    bc_vareaaxid = json['bc_vareaaxid'];
  }
}

class DepartamentoAX {
  String? bc_codigo;
  String? bc_name;
  String? bc_nombre;
  String? bc_vdivision;
  String? bc_vdepartamentoaxid;

  DepartamentoAX({
    this.bc_codigo,
    this.bc_name,
    this.bc_nombre,
    this.bc_vdivision,
    this.bc_vdepartamentoaxid,
  });

  DepartamentoAX.fromJson(Map<String, dynamic> json) {
    bc_codigo = json['bc_codigo'];
    bc_name = json['bc_name'];
    bc_nombre = json['bc_nombre'];
    bc_vdivision = json['bc_vdivision'];
    bc_vdepartamentoaxid = json['bc_vdepartamentoaxid'];
  }
}

class CentroCostosAX {
  String? bc_codigo;
  String? bc_name;
  String? bc_nombre;
  String? bc_vdivision;
  String? bc_vcentrocostosaxid;

  CentroCostosAX({
    this.bc_codigo,
    this.bc_name,
    this.bc_nombre,
    this.bc_vdivision,
    this.bc_vcentrocostosaxid,
  });

  CentroCostosAX.fromJson(Map<String, dynamic> json) {
    bc_codigo = json['bc_codigo'];
    bc_name = json['bc_name'];
    bc_nombre = json['bc_nombre'];
    bc_vdivision = json['bc_vdivision'];
    bc_vcentrocostosaxid = json['bc_vcentrocostosaxid'];
  }
}

class LineaProduccionAX {
  String? bc_codigo;
  String? bc_name;
  String? bc_nombre;
  String? bc_vdivision;
  String? bc_vlineaproduccionaxid;

  LineaProduccionAX({
    this.bc_codigo,
    this.bc_name,
    this.bc_nombre,
    this.bc_vdivision,
    this.bc_vlineaproduccionaxid,
  });

  LineaProduccionAX.fromJson(Map<String, dynamic> json) {
    bc_codigo = json['bc_codigo'];
    bc_name = json['bc_name'];
    bc_nombre = json['bc_nombre'];
    bc_vdivision = json['bc_vdivision'];
    bc_vlineaproduccionaxid = json['bc_vlineaproduccionaxid'];
  }
}

class DH {
  String? bc_name;
  String? bc_tipodh;
  String? bc_tipodhname;
  String? bc_vcolaborador;
  String? bc_vcolaboradorname;
  String? bc_vdhid;

  DH({
    this.bc_name,
    this.bc_tipodh,
    this.bc_tipodhname,
    this.bc_vcolaborador,
    this.bc_vcolaboradorname,
    this.bc_vdhid,
  });

  DH.fromJson(Map<String, dynamic> json) {
    bc_name = json['bc_name'];
    bc_tipodh = json['bc_tipodh'];
    bc_tipodhname = json['bc_tipodhname'];
    bc_vcolaborador = json['bc_vcolaborador'];
    bc_vcolaboradorname = json['bc_vcolaboradorname'];
    bc_vdhid = json['bc_vdhid'];
  }
}

class Choices {
  String? columnname;
  String? choicevalue;
  String? choicename;
  String? displayorder;

  Choices({
    this.columnname,
    this.choicevalue,
    this.choicename,
    this.displayorder,
  });

  Choices.fromJson(Map<String, dynamic> json) {
    columnname = json['columnname'];
    choicevalue = json['choicevalue'];
    choicename = json['choicename'];
    displayorder = json['displayorder'];
  }
}

class Catalogos {
  List<DivisionFlota>? division;
  List<EmpresaNominista>? empresaNominista;
  List<TipoNomina>? tipoNomina;
  List<Departamento>? departamento;
  List<SucursalNominal>? sucursalNominal;
  List<PuestoAsignado>? puestoAsignado;
  List<ImporteAsignado>? importeAsignado;
  List<SucursalAX>? sucursalAX;
  List<AreaAX>? areaAX;
  List<DepartamentoAX>? departamentoAX;
  List<CentroCostosAX>? centroCostosAX;
  List<LineaProduccionAX>? lineaProduccionAX;
  List<Choices>? choices;
  List<DH>? dhs;

  Catalogos({
    this.division,
    this.empresaNominista,
    this.tipoNomina,
    this.departamento,
    this.sucursalNominal,
    this.puestoAsignado,
    this.importeAsignado,
    this.sucursalAX,
    this.areaAX,
    this.departamentoAX,
    this.centroCostosAX,
    this.lineaProduccionAX,
    this.choices,
  });

  Catalogos.fromJson(Map<String, dynamic> json) {
    if (json['division'] != null) {
      division = (json['division'] as List)
          .map((i) => DivisionFlota.fromJson(i))
          .toList();
    }
    if (json['empresaNominista'] != null) {
      empresaNominista = (json['empresaNominista'] as List)
          .map((i) => EmpresaNominista.fromJson(i))
          .toList();
    }
    if (json['tipoNomina'] != null) {
      tipoNomina = (json['tipoNomina'] as List)
          .map((i) => TipoNomina.fromJson(i))
          .toList();
    }
    if (json['departamento'] != null) {
      departamento = (json['departamento'] as List)
          .map((i) => Departamento.fromJson(i))
          .toList();
    }
    if (json['sucursalNominal'] != null) {
      sucursalNominal = (json['sucursalNominal'] as List)
          .map((i) => SucursalNominal.fromJson(i))
          .toList();
    }
    if (json['puestoAsignado'] != null) {
      puestoAsignado = (json['puestoAsignado'] as List)
          .map((i) => PuestoAsignado.fromJson(i))
          .toList();
    }
    if (json['importeAsignado'] != null) {
      importeAsignado = (json['importeAsignado'] as List)
          .map((i) => ImporteAsignado.fromJson(i))
          .toList();
    }
    if (json['sucursalAX'] != null) {
      sucursalAX = (json['sucursalAX'] as List)
          .map((i) => SucursalAX.fromJson(i))
          .toList();
    }
    if (json['areaAX'] != null) {
      areaAX = (json['areaAX'] as List)
          .map((i) => AreaAX.fromJson(i))
          .toList();
    }
    if (json['departamentoAX'] != null) {
      departamentoAX = (json['departamentoAX'] as List)
          .map((i) => DepartamentoAX.fromJson(i))
          .toList();
    }
    if (json['centroCostosAX'] != null) {
      centroCostosAX = (json['centroCostosAX'] as List)
          .map((i) => CentroCostosAX.fromJson(i))
          .toList();
    }
    if (json['lineaProduccionAX'] != null) {
      lineaProduccionAX = (json['lineaProduccionAX'] as List)
          .map((i) => LineaProduccionAX.fromJson(i))
          .toList();
    }
    if (json['choices'] != null) {
      choices = (json['choices'] as List)
          .map((i) => Choices.fromJson(i))
          .toList();
    }
    if (json['dHs'] != null) {
      dhs = (json['dHs'] as List)
          .map((i) => DH.fromJson(i))
          .toList();
    }
  }
}