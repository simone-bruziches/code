class DatiHome {
  String numero;
  int percentuale;
  bool aumento;

  DatiHome({this.numero, this.percentuale, this.aumento});

  DatiHome.fromJson(Map<String, dynamic> json) {
    numero = json['numero'];
    percentuale = json['percentuale'];
    aumento = json['aumento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numero'] = this.numero;
    data['percentuale'] = this.percentuale;
    data['aumento'] = this.aumento;
    return data;
  }
}