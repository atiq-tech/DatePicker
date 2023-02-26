class Travel {
  String country;
  String address;
  String img;
  Travel(this.country, this.address, this.img);
  static List<Travel> generatedTravelList() {
    return [
      Travel("Bangladesh", "BD National Flag", "images/BD.jpg"),
      Travel("Pakistan", "Lahore", "images/Pt.jpg"),
      Travel("India", "Kolkata", "images/IN.jpg"),
      Travel("Japan", "Japanies", "images/Jpn.jpg"),
      Travel("SuizerLand", "City SuizerLand", "images/szrlnd.jpg"),
      Travel("Turkey", "Turkish", "images/tur.jpg"),
      Travel("Argentina", "Argentine", "images/Arg.jpg"),
      Travel("America", "Amerian", "images/Ac.webp"),
      Travel("South Africa", "Amazon", "images/new2.jpg"),
      Travel("Italy", "Italian", "images/Italy.webp"),
    ];
  }

  static List<Travel> mostPopular() {
    return [
      Travel("Ertugrul bey", "Hero of Dirilis", "images/ertugrul.jpg"),
      Travel("Halima", "Heroine of Dirilis", "images/halima.jpg"),
      Travel("Osman bey", "Hero of qurulus", "images/osman.jpg"),
      Travel("Bala hatun", "Heroine of qurulus", "images/bala.jpg"),
      Travel("Bamse bey", "Alp of Ertugrul", "images/bamse.jpg"),
      Travel("Turkut", "Alp of Ertugrul", "images/turkut.jpg"),
      Travel("Ashlihan", "Heroine of Dirilis", "images/aslihan.jpg"),
      Travel("Aygul", "Hero of qurulus", "images/aygul.jpg"),
      Travel("Celchan", "Heroine of Dirilis", "images/celcan.jpg"),
      Travel("South Africa", "Amazon", "images/new1.jpg"),
    ];
  }
}
