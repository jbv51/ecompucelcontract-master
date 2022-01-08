class measurementModeCustom {
  dynamic Formulaid,
      m1,
      m2,
      m3,
      m4,
      m5,
      m6,
      m7,
      UnitName,
      m8,
      m9,
      m10,
      actualFormula;

  measurementModeCustom(
      {this.Formulaid,
      this.m1,
      this.m2,
      this.m3,
      this.m4,
      this.m5,
      this.m6,
      this.m7,
      this.UnitName,
      this.m8,
      this.m9,
      this.m10,
      this.actualFormula});

  factory measurementModeCustom.fromJson(Map<String, dynamic> json) {
    return measurementModeCustom(
      Formulaid: json['Formulaid'],
      m1: json['m1'],
      m2: json['m2'],
      m3: json['m3'],
      m4: json['m4'],
      m5: json['m5'],
      m6: json['m6'],
      m7: json['m7'],
      UnitName: json['UnitName'],
      m8: json['m8'],
      m9: json['m9'],
      m10: json['m10'],
      actualFormula: json['actualFormula'],
    );
  }
}
