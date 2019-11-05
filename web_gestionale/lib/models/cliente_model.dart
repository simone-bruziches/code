class Cliente {
  String imgPath;
  String nome;
  String email;
  bool stato;
  String messaggiDaLeggere;
  String abbonamentiAttivi;
  bool alert;
  String azioni;

  Cliente(
      {this.imgPath,
      this.nome,
      this.email,
      this.stato,
      this.messaggiDaLeggere,
      this.abbonamentiAttivi,
      this.alert,
      this.azioni});
}
