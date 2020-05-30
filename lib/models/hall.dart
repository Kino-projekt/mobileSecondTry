class Hall {

  int id;
  String name;
  int countOfSeats;

  Hall({this.id, this.name, this.countOfSeats});

  Hall.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    countOfSeats = json['countOfSeats'];
  }
}